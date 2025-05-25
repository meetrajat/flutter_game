import 'package:flutter/material.dart';

class HangmanDrawing extends StatelessWidget {
  final int wrongGuesses;

  const HangmanDrawing({required this.wrongGuesses});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 250),
      painter: HangmanPainter(wrongGuesses: wrongGuesses),
    );
  }
}

class HangmanPainter extends CustomPainter {
  final int wrongGuesses;

  HangmanPainter({required this.wrongGuesses});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Draw gallows
    canvas.drawLine(Offset(40, size.height), Offset(160, size.height), paint);
    canvas.drawLine(Offset(100, size.height), Offset(100, 20), paint);
    canvas.drawLine(Offset(100, 20), Offset(160, 20), paint);
    canvas.drawLine(Offset(160, 20), Offset(160, 40), paint);

    if (wrongGuesses >= 1) {
      // Head
      canvas.drawCircle(Offset(160, 60), 20, paint);
    }
    if (wrongGuesses >= 2) {
      // Body
      canvas.drawLine(Offset(160, 80), Offset(160, 140), paint);
    }
    if (wrongGuesses >= 3) {
      // Left arm
      canvas.drawLine(Offset(160, 90), Offset(130, 120), paint);
    }
    if (wrongGuesses >= 4) {
      // Right arm
      canvas.drawLine(Offset(160, 90), Offset(190, 120), paint);
    }
    if (wrongGuesses >= 5) {
      // Left leg
      canvas.drawLine(Offset(160, 140), Offset(130, 180), paint);
    }
    if (wrongGuesses >= 6) {
      // Right leg
      canvas.drawLine(Offset(160, 140), Offset(190, 180), paint);
    }
  }

  @override
  bool shouldRepaint(HangmanPainter oldDelegate) {
    return oldDelegate.wrongGuesses != wrongGuesses;
  }
}
