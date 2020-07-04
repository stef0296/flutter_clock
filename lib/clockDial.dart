import 'dart:math';

import 'package:flutter/material.dart';

class ClockDial extends CustomPainter {
  final numeralList = [
    '12',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11'
  ];

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  ClockDial()
      : tickPaint = Paint()..color = Colors.blueGrey,
        textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle = const TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 15.0,
        );

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = min(centerX, centerY);
    var tickMarkLength;
    final angle = pi / 30;
    final hourTickMarkLength = 10.0;
    final minuteTickMarkLength = 5.0;
    final hourTickMarkWidth = 3.0;
    final minuteTickMarkWidth = 1.5;

    canvas.save();

    canvas.translate(radius, radius);

    for (var i = 0; i < 60; i++) {
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
      tickPaint.strokeWidth =
          i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -radius + tickMarkLength), tickPaint);

      //draw the text
      if (i % 5 == 0) {
        canvas.save();
        canvas.translate(0.0, -radius + 20.0);

        textPainter.text = new TextSpan(
          text: '${numeralList[i ~/ 5]}',
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle * i);

        textPainter.layout();

        textPainter.paint(canvas,
            new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

        canvas.restore();
      }

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
