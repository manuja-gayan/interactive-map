import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';

class TextAreaSmallWithClip extends StatelessWidget {
  const TextAreaSmallWithClip({
    Key? key,
    required this.screenSize,
    required this.width,
    required this.prefixText,
    required this.description,
  }) : super(key: key);

  final Size screenSize;
  final String prefixText;
  final String description;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainer(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        
        //alignment: Alignment.centerLeft,
        transformAlignment: Alignment.centerLeft,
        width: width * Utils.getMultiplier(screenSize.width),
        padding: EdgeInsets.only(
          top: screenSize.width * (25 / VideoAspectRatio.height),
          bottom: screenSize.width * (25 / VideoAspectRatio.height),
          left: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (75 / VideoAspectRatio.width),
          right: screenSize.height * (35 / VideoAspectRatio.width),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              prefixText,
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                color: AppColors.fern,
                  fontSize: Utils.getTopicTextSize(screenSize.width) *
                    (screenSize.width / VideoAspectRatio.width) *
                    Utils.getMultiplier(screenSize.width),
                fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              height: Utils.getVerticleDeviderHeight(screenSize.width),
              padding: EdgeInsets.only(
                left: Utils.getTextPaddingRatio(screenSize.width) * 30,
                right: Utils.getTextPaddingRatio(screenSize.width) * 10,
              ),
              child: const VerticalDivider(
                color: AppColors.fern,
                thickness: 2,
              ),
            ),
            Expanded(
              child: Text(
                description,
                style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 30 *
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
      ),
    );
  }
}
