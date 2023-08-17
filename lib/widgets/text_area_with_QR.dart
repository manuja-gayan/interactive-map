import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaWithQR extends StatelessWidget {
  const TextAreaWithQR({
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
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.night,
      ),
      padding: const EdgeInsets.all(
        65,
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
    );
  }
}
