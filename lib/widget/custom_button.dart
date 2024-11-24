import 'package:calculator_app/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color? fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    super.key,
    required this.text,
    this.fillColor,
    this.textColor = const Color(0xFFFFFFFF),
    this.textSize = 28,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSize.size10),
      child: SizedBox(
        width:AppSize.size65,
        height:AppSize.size65,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor,
          textColor:textColor,
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}