import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container_label.dart';

class CustomButtonLabelWithClip extends StatelessWidget {
  CustomButtonLabelWithClip({
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
    'assets/graphics/Hot_Spot_3.png',
    'assets/graphics/Hot_Spot_4.png'
  ];

  @override
  Widget build(BuildContext context) {
    double ratio_1 =
        screenSize.width <= 700 ? 700 * 0.05 : screenSize.width * 0.05;
    double ratio_2 =
        screenSize.width <= 700 ? 700 * 0.025 : screenSize.width * 0.025;
    print(screenSize.width);
    return Container(
      height: ratio_1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ratio_1,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: ratio_1 / 2,
                    ),
                    child: CustomPaint(
                      //size: Size(700, 700),
                      painter: SqureShapedCustomContainerLabel(),
                      child: Container(
                        height:
                            ratio_1 - ratio_2,
                        padding: EdgeInsets.only(
                          left: ratio_1 / 2 + 10,
                          right: 35,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                text,
                                style: GoogleFonts.barlow(
                                  textStyle: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 30,
                                  
                                  ),
                                ),
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ratio_1,
                  height: ratio_1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(prefixIcons[type]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
