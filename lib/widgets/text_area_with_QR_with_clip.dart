import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container_QR.dart';

class TextAreaWithQRWithClip extends StatelessWidget {
  const TextAreaWithQRWithClip({
    Key? key,
    required this.screenSize,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Size screenSize;
  final double height;
  final double width;
  final String qr_url = 'assets/graphics/QR.png';

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainerQR(),
      child: Container(
        padding: const EdgeInsets.all(
          85,
        ),
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(qr_url),
              fit: BoxFit.cover,
            ),
          ),
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.centerLeft,
          transformAlignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
