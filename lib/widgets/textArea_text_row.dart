import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TextAreaTextRow extends StatelessWidget {
  const TextAreaTextRow({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.fontSize,
    this.ratio = 0.30,
  }) : super(key: key);

  final Size screenSize;
  final List<dynamic> text;
  final double fontSize;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: text[0] == "DECORATEDTEXT"
          ? EdgeInsets.symmetric(
              vertical: Utils.getTextPaddingRatio(screenSize.width) *
                  screenSize.height *
                  (5 / VideoAspectRatio.height))
          : text[0] == "TOPIC"
              ? EdgeInsets.symmetric(
                  vertical: Utils.getTextPaddingRatio(screenSize.width) *
                      screenSize.height *
                      (10 / VideoAspectRatio.height))
              : EdgeInsets.symmetric(
          vertical: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (25 / VideoAspectRatio.height)),
      //width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
      width: screenSize.width * ratio * Utils.getMultiplier(screenSize.width),
      child: text[0] == "TEXT"
          ? Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Utils.getIconTopPaddingRatio(screenSize.width) * 5),
            child: Icon(
              Icons.add,
              color: AppColors.fern,
              size: Utils.getIconResizeRatio(screenSize.width) *
                  screenSize.height *
                  (25 / VideoAspectRatio.height),
            ),
          ),
          Container(
            width: screenSize.width *
                0.01 *
                (screenSize.width / VideoAspectRatio.width),
          ),
          Expanded(
                  child: Text(
                    text[1],
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
            )
          : text[0] == "HYPERLINK"
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => launch(text[2]),
                        child: Text(
                          text[1],
                          style: GoogleFonts.barlow(
                            textStyle: TextStyle(
                              color: AppColors.seaLight,
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
                    ),
                  ],
                )
              : text[0] == "TOPIC"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: text[1],
                                  style: GoogleFonts.barlow(
                                    textStyle: TextStyle(
                                      color: AppColors.fern,
                                      fontSize: fontSize *
                                          (screenSize.width /
                                              VideoAspectRatio.width) *
                                          Utils.getMultiplier(screenSize.width),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: text[2],
                                  style: GoogleFonts.barlow(
                                    textStyle: GoogleFonts.barlow(
                                      textStyle: TextStyle(
                                        color: AppColors.white,
                                        fontSize: fontSize *
                                            (screenSize.width /
                                                VideoAspectRatio.width) *
                                            Utils.getMultiplier(
                                                screenSize.width),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : text[0] == "DECORATEDTEXT"
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.circle,
                                color: text[1] == ""
                                    ? AppColors.white
                                    : AppColors.fern,
                                size:
                                    Utils.getIconResizeRatio(screenSize.width) *
                                        screenSize.height *
                                        (15 / VideoAspectRatio.height),
                              ),
                            ),
                            Container(
                              width: screenSize.width *
                                  0.01 *
                                  (screenSize.width / VideoAspectRatio.width),
                            ),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: text[1],
                                      style: GoogleFonts.barlow(
                                        textStyle: TextStyle(
                                          color: AppColors.fern,
                                          fontSize: fontSize *
                                              (screenSize.width /
                                                  VideoAspectRatio.width) *
                                              Utils.getMultiplier(
                                                  screenSize.width),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: text[2],
                                      style: GoogleFonts.barlow(
                                        textStyle: GoogleFonts.barlow(
                                          textStyle: TextStyle(
                                            color: AppColors.white,
                                            fontSize: fontSize *
                                                (screenSize.width /
                                                    VideoAspectRatio.width) *
                                                Utils.getMultiplier(
                                                    screenSize.width),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
    );
  }
}
