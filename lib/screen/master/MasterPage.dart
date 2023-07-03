import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/controller/BottomNavigationController.dart';
import 'package:flutter_widgets_testing/screen/feed/Feed.dart';
import 'package:flutter_widgets_testing/screen/friends/Friend.dart';
import 'package:flutter_widgets_testing/screen/home/HomeScreen.dart';
import 'package:flutter_widgets_testing/screen/home/Upload.dart';
import 'package:flutter_widgets_testing/screen/inbox/Inbox.dart';
import 'package:flutter_widgets_testing/screen/profile/Profile.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class MasterPageView extends StatefulWidget {
  const MasterPageView({super.key});

  @override
  State<MasterPageView> createState() => _MasterPageVieweState();
}

class _MasterPageVieweState extends State<MasterPageView> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: controller.currentIndexPage == 0 ||
                  controller.currentIndexPage == 1
              ? AppColor.defaultBlackColor
              : AppColor.defaultWhiteColor,
          body: PageStorage(
            bucket: bucket,
            child: controller.navigationPage[controller.currentIndexPage],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            elevation: 0,
            notchMargin: 0.0,
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 65.0,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              color: controller.currentIndexPage == 0 ||
                      controller.currentIndexPage == 1
                  ? Colors.transparent
                  : AppColor.defaultWhiteColor,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Home Screen
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(0);
                      },
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                                controller.currentIndexPage == 0
                                    ? Icons.home_filled
                                    : Icons.home,
                                size: 25,
                                color: controller.currentIndexPage == 0
                                    ? AppColor.defaultWhiteColor
                                    : AppColor.secondaryTextColor),
                            MyTextWidget(
                              text: "Home",
                              color: controller.currentIndexPage == 0
                                  ? AppColor.defaultWhiteColor
                                  : AppColor.secondaryTextColor,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                    ),

                    //End Home Screen

                    //Friends Screen
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(1);
                      },
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              controller.currentIndexPage == 1
                                  ? Icons.group
                                  : Icons.group_outlined,
                              size: 25,
                              color: controller.currentIndexPage == 1
                                  ? AppColor.defaultWhiteColor
                                  : AppColor.secondaryTextColor,
                            ),
                            MyTextWidget(
                              text: "Friends",
                              color: controller.currentIndexPage == 1
                                  ? AppColor.defaultWhiteColor
                                  : AppColor.secondaryTextColor,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                    ),

                    //End Friends Screen

                    //Upload
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const UploadScreenWidget());
                          print("Tap");
                        },
                        child: Container(
                          width: 52,
                          height: 33,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 45,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFff0050),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 45,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF00f2ea),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.currentIndexPage == 0 ||
                                          controller.currentIndexPage == 1
                                      ? AppColor.defaultWhiteColor
                                      : AppColor.defaultBlackColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: controller.currentIndexPage == 0 ||
                                          controller.currentIndexPage == 1
                                      ? AppColor.defaultBlackColor
                                      : AppColor.defaultWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        )),

                    //End Upload Screen

                    //Inbox Screen
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(3);
                      },
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              controller.currentIndexPage == 3
                                  ? Icons.message
                                  : Icons.message_outlined,
                              size: 25,
                              color: controller.currentIndexPage == 3
                                  ? AppColor.defaultBlackColor
                                  : AppColor.secondaryTextColor,
                            ),
                            MyTextWidget(
                              text: "Inbox",
                              color: controller.currentIndexPage == 3
                                  ? AppColor.defaultBlackColor
                                  : AppColor.secondaryTextColor,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                    ),

                    //End Inbox Screen

                    //Profile Screen
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(4);
                      },
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            Icon(
                              controller.currentIndexPage == 4
                                  ? Icons.person
                                  : Icons.person_outlined,
                              size: 25,
                              color: controller.currentIndexPage == 4
                                  ? AppColor.defaultBlackColor
                                  : AppColor.secondaryTextColor,
                            ),
                            MyTextWidget(
                              text: "Profile",
                              color: controller.currentIndexPage == 4
                                  ? AppColor.defaultBlackColor
                                  : AppColor.secondaryTextColor,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ),
                    ),

                    //End Profile Screen
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
