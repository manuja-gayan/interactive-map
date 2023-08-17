import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';

class CustomButtonLabelMobile extends StatelessWidget {
  const CustomButtonLabelMobile({
    Key? key,
    required this.width,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.night),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
