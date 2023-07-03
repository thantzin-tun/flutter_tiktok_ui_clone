import 'package:flutter/material.dart';
import 'package:flutter_widgets_testing/screen/profile/MyQRCode.dart';
import 'package:flutter_widgets_testing/screen/profile/ProfileBottomSheet.dart';
import 'package:flutter_widgets_testing/screen/profile/ProfileView.dart';
import 'package:flutter_widgets_testing/screen/profile/SignAccount.dart';
import 'package:flutter_widgets_testing/screen/profile/SocialStatus.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyButtonWidget.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/state_manager.dart';

import '../../widgets/MyTextWidget.dart';

final switchAccount = StateProvider((ref) => true);

class ProfileViewPage extends StatefulWidget {
  const ProfileViewPage({super.key});

  @override
  State<ProfileViewPage> createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  int selectIndex = 0;

  List<IconData> icons = [
    Icons.line_style_outlined,
    Icons.lock_outline_rounded,
    Icons.bookmark_border,
    Icons.favorite_border_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Get.to(() => ProfileView());
                },
                icon: Icon(
                  Icons.person,
                  color: AppColor.defaultBlackColor,
                )),
            IconButton(
                onPressed: () {
                  ShowModalBottomSheetWidget(context);
                },
                icon: Icon(
                  Icons.menu,
                  color: AppColor.defaultBlackColor,
                )),
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: AppColor.defaultWhiteColor,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13))),
                  elevation: 2,
                  context: context,
                  builder: (context) {
                    return Consumer(
                      builder: (context, ref, child) {
                        final changeAccount = ref.watch(switchAccount);
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            height: 220,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Center(
                                            child: MyTextWidget(
                                      text: "Switch Account",
                                      color: AppColor.defaultBlackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ))),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: AppColor.defaultBlackColor,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  onTap: () => {
                                    ref.read(switchAccount.notifier).state =
                                        true
                                  },
                                  contentPadding: const EdgeInsets.all(0.0),
                                  horizontalTitleGap: 0.0,
                                  title: MyTextWidget(
                                    text: "visionclip990",
                                    color: AppColor.defaultBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  trailing: changeAccount
                                      ? Icon(
                                          Icons.done,
                                          color: AppColor.tittokRed,
                                          size: 30.0,
                                        )
                                      : null,
                                  leading: const CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage("assets/images/six.jpg"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  onTap: () => {
                                    ref.read(switchAccount.notifier).state =
                                        false,
                                    Navigator.of(context).pop(),
                                    Get.to(() => const SingUpScreen(),
                                        transition: Transition.downToUp)
                                  },
                                  contentPadding: const EdgeInsets.all(0.0),
                                  horizontalTitleGap: 0.0,
                                  title: MyTextWidget(
                                    text: "Add account",
                                    color: AppColor.defaultBlackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  trailing: !changeAccount
                                      ? Icon(Icons.done,
                                          size: 30.0, color: AppColor.tittokRed)
                                      : null,
                                  leading: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: AppColor.secondaryWhite,
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyTextWidget(
                    text: "ttt",
                    color: AppColor.defaultBlackColor,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: AppColor.defaultBlackColor,
                    size: 25.0,
                  )
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 45,
                backgroundColor: Color.fromARGB(255, 1, 50, 3),
                child: Align(
                  alignment: Alignment.center,
                  child: MyTextWidget(
                    text: "Z",
                    color: AppColor.defaultWhiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyTextWidget(
                    text: "@visionclip990",
                    color: AppColor.defaultBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => const MyQRCodeScreen());
                      },
                      icon: Icon(
                        Icons.qr_code,
                        color: AppColor.secondaryTextColor,
                        size: 18.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //Social Follower,Likes,Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialStatus(
                    number: 230,
                    status: "Following",
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 0.5,
                    height: 25,
                    color: AppColor.secondaryTextColor, //design
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SocialStatus(
                    number: 3294,
                    status: "Followers",
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 0.3, // Adjust the width as per your requirement
                    height: 25, // Adjust the height as per your requirement
                    color: AppColor
                        .secondaryTextColor, // Adjust the color as per your design
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SocialStatus(
                    status: "Likes",
                    number: 500,
                  ),
                ],
              ),
              //End Social

              const SizedBox(
                height: 10,
              ),

              //Button Group
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          elevation: const MaterialStatePropertyAll(0),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 244, 242, 242)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 18))
                          // mouseCursor: MaterialStateMouseCursor.defer,
                          ),
                      onPressed: () {
                        debugPrint("Edit profile");
                      },
                      child: MyTextWidget(
                        text: "Edit profile",
                        fontSize: 14.0,
                        color: AppColor.defaultBlackColor,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          elevation: const MaterialStatePropertyAll(0),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 244, 242, 242)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 18))
                          // mouseCursor: MaterialStateMouseCursor.defer,
                          ),
                      onPressed: () {
                        debugPrint("Add friends");
                      },
                      child: MyTextWidget(
                        text: "Add friends",
                        fontSize: 14.0,
                        color: AppColor.defaultBlackColor,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              //End Button Group

              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 244, 242, 242)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0))
                    // mouseCursor: MaterialStateMouseCursor.defer,
                    ),
                onPressed: () {
                  // Perform action on button press
                },
                icon: Icon(
                  Icons.add,
                  color: AppColor.defaultBlackColor,
                  size: 10,
                ),
                label: MyTextWidget(
                  text: "Add bio",
                  color: AppColor.defaultBlackColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ///////////

              //Custom TabBar
              Expanded(
                child: DefaultTabController(
                  length: icons.length,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColor.defaultBlackColor,
                        labelColor: AppColor.defaultBlackColor,
                        unselectedLabelColor: AppColor.secondaryTextColor,
                        tabs: [
                          for (var icon in icons)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 8.0),
                              child: Icon(
                                icon,
                              ),
                            )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: AppColor.secondaryTextColor,
                                      width: 0.3))),
                          child: TabBarView(
                            children: [
                              // Widget for Tab 1 content
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 25),
                                    Icon(
                                      Icons.photo_filter,
                                      color: AppColor.secondaryTextColor,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyTextWidget(
                                      text: "Share your daily routine",
                                      color: AppColor.defaultBlackColor,
                                      fontSize: 20,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyButtonWidget(
                                      buttonText: "Upload",
                                      buttonColor: AppColor.primaryButtonColor,
                                      buttonTextColor:
                                          AppColor.defaultWhiteColor,
                                    )
                                  ],
                                ),
                              ),
                              // Widget for Tab 2 content
                              Container(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    MyTextWidget(
                                      text: "Your private videos",
                                      color: AppColor.defaultBlackColor,
                                      fontSize: 22,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyTextWidget(
                                      text:
                                          'To make your videos only visible to you, set them to "Private" in settings ',
                                      color: AppColor.secondaryTextColor,
                                      textAlign: true,
                                      fontSize: 18,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                child: Center(child: Text('Tab 3 content')),
                              ),
                              // Widget for Tab 2 content
                              const SizedBox(
                                child: Center(child: Text('Tab 4 content')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
