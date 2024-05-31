import 'package:flutter/material.dart';

class MenuIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // 각 선의 간격을 조절하려면 여기의 값을 변경하세요.
    double space = 8;

    // 상단 선
    canvas.drawLine(Offset(0, space), Offset(size.width, space), paint);
    // 중간 선
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
    // 하단 선
    canvas.drawLine(Offset(0, size.height - space), Offset(size.width, size.height - space), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
