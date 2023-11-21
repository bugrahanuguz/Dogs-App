
import 'package:flutter/material.dart';

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = const Color(0xFFF2F2F7);

    final Path backgroundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(15, 0)
      ..quadraticBezierTo(20, -10, 30, -10)
      ..lineTo(size.width - 30, -10)
      ..quadraticBezierTo(size.width - 20, -10, size.width - 15, 0)
      ..lineTo(size.width, size.height);

    // Kenarlık için Paint ve Path
    final Paint borderPaint = Paint()
      ..color = Color(0xFFE5E5EA) // Kenarlık rengi
      ..strokeWidth = 2 // Kenarlık kalınlığı
      ..style = PaintingStyle.stroke; // Kenarlık stili

    final Path borderPath = Path.from(backgroundPath);

    // Kenarlık çizimi
    canvas.drawPath(borderPath, borderPaint);

    // Arka plan çizimi
    canvas.drawPath(backgroundPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}