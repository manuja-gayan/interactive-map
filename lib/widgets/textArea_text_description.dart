import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAreaTextDescription extends StatelessWidget {
  const TextAreaTextDescription({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.fontSize,
    this.ratio = 0.30,
  }) : super(key: key);

  final Size screenSize;
  final String text;
  final double fontSize;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (15 / VideoAspectRatio.height)),
      // width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
      width: screenSize.width * ratio * Utils.getMultiplier(screenSize.width),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: fontSize *
                      (screenSize.width / VideoAspectRatio.width) *
                      Utils.getMultiplier(screenSize.width),
                ),
              ),
              maxLines: 10,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
