import 'package:flutter/material.dart';

class StickyNotePainter extends CustomPainter {
  StickyNotePainter({required this.color});

  Color color;

  Paint _createGradientPaint(Size size) {
    Paint paint = new Paint();

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RadialGradient gradient = RadialGradient(
        colors: [_brightenColor(color), color],
        radius: 1.0,
        stops: [0.5, 1.0],
        center: Alignment.bottomLeft);
    paint.shader = gradient.createShader(rect);
    return paint;
  }

  Color _brightenColor(Color c, [int percent = 30]) {
    double floatValue = percent / 100;

    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * floatValue).round(),
        c.green + ((255 - c.green) * floatValue).round(),
        c.blue + ((255 - c.blue) * floatValue).round());
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path path = Path();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

  void _drawShadows(Size size, Canvas canvas) {
    Rect rect = Rect.fromLTWH(12, 12, size.width - 24, size.height - 24);
    Path path = new Path();
    path.addRect(rect);
    canvas.drawShadow(path, color, 12.0, true);
  }

  void _drawShadow(Size size, Canvas canvas) {
    Paint shadowPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8)
      ..color = Colors.black.withOpacity(0.16);
    Path shadowPath = new Path();
    shadowPath.moveTo(0, 24);
    shadowPath.lineTo(size.width, 0);
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(size.width / 6, size.height);
    shadowPath.quadraticBezierTo(
        -2, size.height + 2, 0, size.height - (size.width / 6));
    shadowPath.lineTo(0, 0);
    canvas.drawPath(shadowPath, shadowPaint);
  }
}
