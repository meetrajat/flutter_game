import 'package:flutter/material.dart';

class LetterKeyboard extends StatelessWidget {
  final Set<String> guessedLetters;
  final Function(String) onLetterPressed;

  const LetterKeyboard({
    required this.guessedLetters,
    required this.onLetterPressed,
  });

  @override
  Widget build(BuildContext context) {
    const letters = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return Column(
      children: letters.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((letter) {
            final isGuessed = guessedLetters.contains(letter);
            return Padding(
              padding: const EdgeInsets.all(2),
              child: ElevatedButton(
                onPressed: isGuessed ? null : () => onLetterPressed(letter),
                child: Text(letter),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
