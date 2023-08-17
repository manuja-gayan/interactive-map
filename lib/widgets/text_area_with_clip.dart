import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';
import 'package:interactive_map/widgets/textArea_text_Topic.dart';
import 'package:interactive_map/widgets/textArea_text_description.dart';
import 'package:interactive_map/widgets/textArea_text_row.dart';

class TextAreaWithClip extends StatelessWidget {
  const TextAreaWithClip({
    Key? key,
    required this.screenSize,
    required this.texts,
    required this.topic,
    required this.description,
    this.ratio = 0.30,
  }) : super(key: key);

  final Size screenSize;
  final List<dynamic> texts;
  final String topic;
  final String description;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: Size(700, 700),
      painter: SqureShapedCustomContainer(),
      child: Container(
        // width: screenSize.width < 1565 ? 1565 * 0.25 : screenSize.width * 0.25,
        width: screenSize.width * ratio * Utils.getMultiplier(screenSize.width),
        padding: EdgeInsets.only(
          top: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (40 / VideoAspectRatio.height),
          bottom: Utils.getTextPaddingRatio(screenSize.width) *
              screenSize.height *
              (55 / VideoAspectRatio.height),
          left: screenSize.width * (30 / VideoAspectRatio.width),
          right: screenSize.width * (30 / VideoAspectRatio.width),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topic == ''
                ? const SizedBox()
                : TextAreaTextTopic(
                    screenSize: screenSize,
                    text: topic,
                    fontSize: 31,
                    ratio: ratio,
                  ),
            description == ''
                ? const SizedBox()
                : TextAreaTextDescription(
                    screenSize: screenSize,
                    text: description,
                    fontSize: 27,
                    ratio: ratio,
                  ),
            description == '' || texts.length == 0
                ? const SizedBox()
                : SizedBox(
                    height: Utils.getTextPaddingRatio(screenSize.width) *
                        screenSize.height *
                        (45 / VideoAspectRatio.height),
                  ),
            texts.isEmpty || texts.length == 0
                ? const SizedBox()
                : Container(
                    padding: EdgeInsets.only(
                      top: Utils.getTextPaddingRatio(screenSize.width) *
                          screenSize.height *
                          (15 / VideoAspectRatio.height),
                      bottom:
                          screenSize.height * (15 / VideoAspectRatio.height),
                      left: screenSize.width * (15 / VideoAspectRatio.width),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: texts
                          .map<Widget>((text) => TextAreaTextRow(
                                screenSize: screenSize,
                                text: text,
                                fontSize: 28,
                                ratio: ratio,
                              ))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
