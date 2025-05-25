import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final VoidCallback onPlayAgain;
  final String correctWord;

  const SuccessScreen({
    required this.onPlayAgain,
    required this.correctWord,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            Text('Congratulations!\nThe word was: $correctWord',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPlayAgain,
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
