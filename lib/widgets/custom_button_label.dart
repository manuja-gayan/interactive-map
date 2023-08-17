import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';

class CustomButtonLabel extends StatelessWidget {
  CustomButtonLabel({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.type,
  }) : super(key: key);

  final Size screenSize;
  final String text;
  final int type;

  final List<String> prefixIcons = [
    'assets/graphics/Hot_Spot_plain.png',
    'assets/graphics/Hot_Spot_1.png',
    'assets/graphics/Hot_Spot_2.png',
    'assets/graphics/Hot_Spot_3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: screenSize.width * 0.04 - screenSize.width * 0.02,
              margin: EdgeInsets.only(
                left: screenSize.width * 0.04 / 2,
                top: screenSize.width * 0.01,
              ),
              decoration: const BoxDecoration(
                color: AppColors.night,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * 0.04 / 2 + 10,
                  right: 30,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        ),
                      ),
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.04,
              height: screenSize.width * 0.04,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(prefixIcons[type]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
