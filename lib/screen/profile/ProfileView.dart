import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets_testing/screen/profile/Profile.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/CustomSizeBox.dart';
import 'package:flutter_widgets_testing/widgets/MyButtonWidget.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  List<Map<String, dynamic>> profileInformation = [
    {
      "icon": Icon(
        Icons.select_all,
        color: AppColor.defaultBlackColor,
      ),
      "info":
          "Other people can see that you viewed their profiles in the past 30 days"
    },
    {
      "icon": Icon(Icons.lock, color: AppColor.defaultBlackColor),
      "info": "Only you can see who viewed your profile"
    },
    {
      "icon": Icon(Icons.shield, color: AppColor.defaultBlackColor),
      "info":
          "Only viewers who turned on profile views and viewed your profile in the past 30 days will be shown"
    },
    {
      "icon": Icon(Icons.visibility, color: AppColor.defaultBlackColor),
      "info": "You can turn this off at any time"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryWhite,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryWhite,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColor
                .secondaryTextColor, // Customize the color of the divider
            height: 0.3,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30.0,
          ),
          color: AppColor.defaultBlackColor,
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.settings,
                color: AppColor.defaultBlackColor,
                size: 30.0,
              ))
        ],
        title: MyTextWidget(
          text: "Profile views",
          color: AppColor.defaultBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/back.png",
                    width: double.infinity,
                    height: 220,
                  ),
                  Gap(
                    h: 10,
                  ),
                  MyTextWidget(
                    text: "Turn on profile view history?",
                    color: AppColor.defaultBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  MyTextWidget(
                    text: "2 people viewed your profile",
                    color: AppColor.secondaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  Gap(
                    h: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: profileInformation.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: MyTextWidget(
                            text: profileInformation[index]["info"],
                            color: AppColor.secondaryTextColor,
                            fontSize: 12.0,
                          ),
                          leading: profileInformation[index]["icon"],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: MyButtonWidget(
                    buttonText: "Not now",
                    buttonColor: AppColor.defaultWhiteColor,
                    buttonTextColor: AppColor.defaultBlackColor,
                  ),
                ),
                Gap(
                  w: 10,
                ),
                Expanded(
                  child: MyButtonWidget(
                    buttonText: "Turn on",
                    buttonColor: AppColor.tittokRed,
                    buttonTextColor: AppColor.defaultWhiteColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
