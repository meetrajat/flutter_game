import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  final VoidCallback onTryAgain;
  final String correctWord;

  const FailureScreen({
    required this.onTryAgain,
    required this.correctWord,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.close, color: Colors.red, size: 100),
            const SizedBox(height: 20),
            Text('Game Over!\nThe word was: $correctWord',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onTryAgain,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
