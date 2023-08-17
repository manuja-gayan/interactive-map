import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class SqureShapedCustomContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.night
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double w = size.width;
    double h = size.height;
    double wm = w - w * 0.1;
    double hm = h - w * 0.1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, h);
    path0.lineTo(wm, h);
    path0.lineTo(w, hm);
    path0.lineTo(w, 0);
    path0.lineTo(0, 0);

    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
