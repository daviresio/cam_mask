import 'package:flutter/material.dart';

class RectangleMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final backgroundPath = Path()..addRect(Offset.zero & size);

    final left = size.width * .1;
    final right = size.width * .9;
    final top = size.height * .15;
    final bottom = size.height * .85;

    final maskPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(left, top, right, bottom),
        const Radius.circular(8),
      ));

    final path =
        Path.combine(PathOperation.difference, backgroundPath, maskPath);

    canvas.drawPath(path, paint);

    final markPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    const padding = 15.0;
    const lineSize = 30.0;

    final markPath = Path();

    //left top
    markPath
      ..moveTo(left - padding, top + lineSize)
      ..lineTo(left - padding, top - padding)
      ..lineTo(left + lineSize, top - padding);

    // left bottom
    markPath
      ..moveTo(left - padding, bottom - lineSize)
      ..lineTo(left - padding, bottom + padding)
      ..lineTo(left + lineSize, bottom + padding);

    // right top
    markPath
      ..moveTo(right + padding, top + lineSize)
      ..lineTo(right + padding, top - padding)
      ..lineTo(right - lineSize, top - padding);

    // right bottom
    markPath
      ..moveTo(right + padding, bottom - lineSize)
      ..lineTo(right + padding, bottom + padding)
      ..lineTo(right - lineSize, bottom + padding);

    canvas.drawPath(markPath, markPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
