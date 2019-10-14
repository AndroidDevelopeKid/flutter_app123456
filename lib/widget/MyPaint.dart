import 'package:flutter/material.dart';

///画弧形

class MyPaint extends CustomPainter{
  void paint(Canvas canvas, Size size) {
    const PI = 3.1415926;
    final double _radius = 650.0;
    final Offset _offset = Offset(size.width * 0.5, -400.0);

    final Gradient _gradient = new LinearGradient(

      colors: [
        Color(0xff6889FF),
        Color(0xff90A7FF),
      ],
    );

    //定义画笔
    final Paint _paint = Paint()
      ..color = Color(0xff4C88FF)
      ..isAntiAlias = true
      ..shader = _gradient.createShader(Rect.fromLTRB(0.0, 0.0, size.width, size.height))
      ..strokeWidth = 5.0;
    //canvas.drawCircle(_offset, _radius, _paint);
    Rect rect = Rect.fromCircle(center: Offset(size.width * 0.5, -300.0),radius:540.0);
    canvas.drawArc(rect, 0.68
        , 2.2, false, _paint);

  }
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}