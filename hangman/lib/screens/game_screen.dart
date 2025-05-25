import 'package:flutter/material.dart';
import 'dart:math';
import '../models/game_state.dart';
import '../data/questions.dart';
import '../widgets/hangman_drawing.dart';
import '../widgets/letter_keyboard.dart';
import 'success_screen.dart';
import 'failure_screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameState gameState;
  
  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    final random = Random();
    setState(() {
      gameState = GameState(
        currentQuestion: indianQuestions[random.nextInt(indianQuestions.length)]
      );
    });
  }

  Widget buildWordDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: gameState.currentQuestion.word.split('').map((letter) {
        final isRevealed = gameState.guessedLetters.contains(letter);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            isRevealed ? letter : '_',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  void handleLetterGuess(String letter) {
    if (gameState.guessedLetters.contains(letter)) return;

    setState(() {
      final newGuessedLetters = Set<String>.from(gameState.guessedLetters)..add(letter);
      final isWrongGuess = !gameState.currentQuestion.word.contains(letter);
      
      gameState = gameState.copyWith(
        guessedLetters: newGuessedLetters,
        wrongGuesses: isWrongGuess ? gameState.wrongGuesses + 1 : gameState.wrongGuesses,
      );

      if (gameState.isGameOver) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FailureScreen(
              onTryAgain: () {
                Navigator.pop(context);
                startNewGame();
              },
              correctWord: gameState.currentQuestion.word,
            ),
          ),
        );
      } else if (gameState.isWon) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SuccessScreen(
              onPlayAgain: () {
                Navigator.pop(context);
                startNewGame();
              },
              correctWord: gameState.currentQuestion.word,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Indian Hangman')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          HangmanDrawing(wrongGuesses: gameState.wrongGuesses),
          const SizedBox(height: 20),
          Text(
            'Category: ${gameState.currentQuestion.category}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Hint: ${gameState.currentQuestion.hint}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          buildWordDisplay(),
          const Spacer(),
          LetterKeyboard(
            guessedLetters: gameState.guessedLetters,
            onLetterPressed: handleLetterGuess,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
