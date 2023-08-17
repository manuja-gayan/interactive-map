import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/widgets/textArea_text_Topic.dart';
import 'package:interactive_map/widgets/textArea_text_description.dart';
import 'package:interactive_map/widgets/textArea_text_row.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    Key? key,
    required this.screenSize,
    required this.texts,
    required this.topic,
    required this.description,
  }) : super(key: key);

  final Size screenSize;
  final List<List<String>> texts;
  final String topic;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.night,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topic == ''
              ? const SizedBox()
              : TextAreaTextTopic(
                  screenSize: screenSize,
                  text: topic,
                  fontSize: 19,
                ),
          description == ''
              ? const SizedBox()
              : TextAreaTextDescription(
                  screenSize: screenSize,
                  text: description,
                  fontSize: 18,
                ),
          topic == ''
              ? const SizedBox()
              : const SizedBox(
                  height: 15,
                ),
          texts.isEmpty
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: texts
                        .map<Widget>((text) => TextAreaTextRow(
                              screenSize: screenSize,
                              text: text,
                              fontSize: 18,
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
