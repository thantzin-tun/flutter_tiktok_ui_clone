import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets_testing/screen/master/MasterPage.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/CustomSizeBox.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MasterPageView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultBlackColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/tiktok.svg",
            width: 80.0,
          ),
          Gap(
            h: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyTextWidget(
                text: "TikT",
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: AppColor.defaultWhiteColor,
              ),
              Container(
                width: 30,
                height: 30,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 26,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                                width: 8.0, color: AppColor.tittokBlue),
                            color: const Color(0xFFff0050),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 26,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                                width: 8.0, color: AppColor.tittokRed),
                            color: const Color(0xFF00f2ea),
                          )),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                              width: 6.0, color: AppColor.defaultWhiteColor),
                          color: AppColor.defaultBlackColor),
                    ),
                  ],
                ),
              ),
              MyTextWidget(
                text: "k",
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: AppColor.defaultWhiteColor,
              ),
            ],
          )
        ],
      )),
    );
  }
}
