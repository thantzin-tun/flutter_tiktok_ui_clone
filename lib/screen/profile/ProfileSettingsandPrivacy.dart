import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class SettingsAndPrivacyScreen extends StatelessWidget {
  SettingsAndPrivacyScreen({super.key});

  List<Map<String, dynamic>> profileMenu = [
    {
      "status": "Account",
      "infoList": [
        {"icon": Icons.person, "iconName": "Account"},
        {"icon": Icons.lock, "iconName": "Privacy"},
        {"icon": Icons.verified_user, "iconName": "Security"},
        {"icon": Icons.balance, "iconName": "Balance"},
        {"icon": Icons.share, "iconName": "Share Profile"},
      ]
    },
    {
      "status": "Content & Display",
      "infoList": [
        {"icon": Icons.notifications, "iconName": "Notifications"},
        {"icon": Icons.live_tv, "iconName": "LIVE"},
        {"icon": Icons.timer, "iconName": "Comment and watch history"},
        {"icon": Icons.video_call, "iconName": "Content preferences"},
        {"icon": Icons.play_circle, "iconName": "Playback"},
        {"icon": Icons.language, "iconName": "Language"},
        {"icon": Icons.timer, "iconName": "Screen time"},
        {"icon": Icons.home_max_sharp, "iconName": "Family Pairing"},
        {"icon": Icons.accessibility, "iconName": "Accessibility"},
      ]
    },
    {
      "status": "Cache & Cellular",
      "infoList": [
        {"icon": Icons.auto_delete, "iconName": "Free up space"},
        {"icon": Icons.data_saver_on, "iconName": "Data Saver"},
        {"icon": Icons.wallpaper, "iconName": "Wallpaper"},
      ]
    },
    {
      "status": "Cache & Cellular",
      "infoList": [
        {"icon": Icons.report_problem, "iconName": "Report a problem"},
        {"icon": Icons.support, "iconName": "Support"},
        {"icon": Icons.info, "iconName": "Wallpaper"},
      ]
    },
    {
      "status": "Login",
      "infoList": [
        {"icon": Icons.switch_account, "iconName": "Switch account"},
        {"icon": Icons.logout, "iconName": "Support"},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.secondaryWhite,
        body: CustomScrollView(
          slivers: [

            SliverAppBar(
                backgroundColor: AppColor.secondaryWhite,
                elevation: 0,
                expandedHeight: 100,
                pinned: true,
                floating: true,
                snap: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColor.defaultBlackColor,
                    )),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  centerTitle: true,
                  title: MyTextWidget(
                    text: "Settings and privacy",
                    fontSize: 16.0,
                    color: AppColor.defaultBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: MyTextWidget(
                          text: profileMenu[index]["status"],
                          color: AppColor.defaultBlackColor,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.defaultWhiteColor),
                        child: Column(children: <Widget>[
                          for (var j = 0;
                              j < profileMenu[index]["infoList"].length;
                              j++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(profileMenu[index]
                                            ["infoList"][j]["icon"]),color: AppColor.secondaryTextColor,),
                                    MyTextWidget(
                                      text: profileMenu[index]["infoList"][j]
                                          ["iconName"],
                                      fontSize: 15.0,
                                      color: AppColor.defaultBlackColor,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                )
                              ],
                            ),
                        ]),
                      ),
                    ],
                  ),
                );
              }, childCount: profileMenu.length),
            ),
          ],
        ));
  }
}
