// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';

class MyTextWidget extends StatelessWidget {

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double? wordSpacing;
  final String? fontFamily;
  final double? letterSpacing;
  final bool textAlign;

  const MyTextWidget(
      {super.key,
      this.text = "Button",
      this.textAlign = false,
      this.color = Colors.white,
      this.fontSize = 20,
      this.fontStyle = FontStyle.normal,
      this.wordSpacing,
      this.fontFamily,
      this.letterSpacing,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          wordSpacing: wordSpacing,
          fontFamily: fontFamily,
        ));
  }
}
