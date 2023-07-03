import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class CreaterTools extends StatefulWidget {
  const CreaterTools({super.key});

  @override
  State<CreaterTools> createState() => _CreaterToolsState();
}

class _CreaterToolsState extends State<CreaterTools> {
  bool adSettings = false;
  bool publishSettings = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileMenu = [
      {
        "status": "General",
        "infoList": [
          {"icon": Icons.analytics_sharp, "iconName": "Analytics"},
          {"icon": Icons.star_border, "iconName": "Creator Portal"},
          {"icon": Icons.question_mark_sharp, "iconName": " Q & A"},
        ]
      }
    ];
    List<Map<String, dynamic>> adSettingsAndCheck = [
      {
        "id": 1,
        "status": "Settings",
        "title": "Ad settings",
        "onOff": adSettings,
        "description":
            'With this settings on, youll be able to allow advertisers to user you post in their ads, and choose whether your post will only how as an ad.You can manage how advertisers can use your content under "..." > "Ad settings" on each of your posts. ',
        // "function": () {
        //   setState(() {
        //     adSettings = !adSettings;
        //   });
        // }
      },
      {
        "id": 2,
        "status": "Publish settings",
        "onOff": publishSettings,
        "title": "Video sound copyright check",
        "description": "Auto check every time there's a new post",
        // "function": () {
        //   setState(() {
        //     publishSettings = !publishSettings;
        //   });
        // }
      },
    ];
    return Scaffold(
      backgroundColor: AppColor.secondaryWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              titleSpacing: 0.0,
              backgroundColor: AppColor.secondaryWhite,
              elevation: 0,
              expandedHeight: 100,
              pinned: false,
              floating: false,
              snap: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.defaultBlackColor,
                  )),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 20.0),
                title: MyTextWidget(
                  text: "Creator tools",
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
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
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
                                    icon: Icon(profileMenu[index]["infoList"][j]
                                        ["icon"]),
                                    color: AppColor.secondaryTextColor,
                                  ),
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
                      padding: const EdgeInsets.only(left: 15.0, top: 10),
                      child: MyTextWidget(
                        text: adSettingsAndCheck[index]["status"],
                        color: AppColor.defaultBlackColor,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.defaultWhiteColor),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                MyTextWidget(
                                  text: adSettingsAndCheck[index]["title"],
                                  fontSize: 15.0,
                                  color: AppColor.defaultBlackColor,
                                ),
                                Switch(
                                  activeColor: AppColor.tittokBlue,
                                  activeTrackColor:
                                      Color.fromARGB(255, 151, 239, 236),
                                  inactiveThumbColor:
                                      AppColor.secondaryTextColor,
                                  inactiveTrackColor: AppColor.secondaryWhite,
                                  value:adSettingsAndCheck[index]["onOff"] ,
                                  onChanged: (bool value) {
                                    setState(() {
                                      if(adSettingsAndCheck[index]["id"] == 1) {
                                      adSettings = !adSettings;
                                      }
                                      else {
                                          publishSettings  = !publishSettings;
                                      }
                                    });
                                  },
                                )
                                //Switch
                              ],
                            ),
                            MyTextWidget(
                              text: adSettingsAndCheck[index]["description"],
                              color: AppColor.secondaryTextColor,
                              fontSize: 13,
                            )
                          ]),
                    ),
                  ],
                ),
              );
            }, childCount: adSettingsAndCheck.length),
          ),
        ],
      ),
    );
  }
}
