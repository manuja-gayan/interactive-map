import 'package:flutter/material.dart';

void customPushReplacement(BuildContext context, Widget page,
    {Duration duration = const Duration(seconds: 2)}) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    ),
  );
}
