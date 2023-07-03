// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';

import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class MyButtonWidget extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Function? buttonFunc;
  Color? buttonTextColor;
  double? fontSize;

  MyButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      this.buttonFunc,
      this.buttonTextColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Follow Button is clicking");
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 5.0, // Adjust this value to decrease vertical padding
            horizontal:
                25.0, // Adjust this value to increase horizontal padding
          ),
        ),
      ),
      child: MyTextWidget(
        text: buttonText,
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? 15,
        color: buttonTextColor ?? AppColor.defaultBlackColor,
      ),
    );
  }
}
