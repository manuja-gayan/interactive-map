import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';

class TextAreaSmall extends StatelessWidget {
  const TextAreaSmall({
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      //alignment: Alignment.centerLeft,
      transformAlignment: Alignment.centerLeft,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.night,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
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
              fontSize: 55,
              fontWeight: FontWeight.bold,
              ),
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
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
                fontSize: 20,
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
