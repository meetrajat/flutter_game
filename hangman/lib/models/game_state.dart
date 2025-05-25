import '../data/questions.dart';

class GameState {
  final Question currentQuestion;
  final Set<String> guessedLetters;
  final int wrongGuesses;
  
  GameState({
    required this.currentQuestion,
    this.guessedLetters = const {},
    this.wrongGuesses = 0,
  });

  bool get isGameOver => wrongGuesses >= 6;
  bool get isWon => currentQuestion.word
      .split('')
      .every((letter) => guessedLetters.contains(letter));

  GameState copyWith({
    Question? currentQuestion,
    Set<String>? guessedLetters,
    int? wrongGuesses,
  }) {
    return GameState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      guessedLetters: guessedLetters ?? this.guessedLetters,
      wrongGuesses: wrongGuesses ?? this.wrongGuesses,
    );
  }
}
