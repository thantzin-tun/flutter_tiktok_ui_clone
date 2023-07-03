import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyButtonWidget.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class FriendViewPage extends StatefulWidget {
  const FriendViewPage({super.key});

  @override
  State<FriendViewPage> createState() => _FriendViewPageState();
}

class _FriendViewPageState extends State<FriendViewPage> {
  List<Map<String, dynamic>> friends = [
    {
      "name": "Facebook friends",
      "status": "From your contacts",
      "profile": "assets/images/facebook.webp"
    },
    {
      "name": "Myat Noe Eain",
      "status": "From your contacts",
      "profile": "assets/images/one.jpg"
    },
    {
      "name": "Chit Chit",
      "status": "From your contact",
      "profile": "assets/images/two.jpg"
    },
    {
      "name": "Shwe Yamin",
      "status": "People you may know",
      "profile": "assets/images/three.jpg"
    },
    {
      "name": "Poe Kyi Phyu",
      "status": "From your contacts",
      "profile": "assets/images/four.jpg"
    },
    {
      "name": "Lae Lae Moe",
      "status": "From your contacts",
      "profile": "assets/images/five.jpg"
    },
    {
      "name": "Eaindra Soe Moe",
      "status": "People you may know",
      "profile": "assets/images/six.jpg"
    },
    {
      "name": "A Kyi Nar",
      "status": "Friends with",
      "profile": "assets/images/seven.jpg"
    },
    {
      "name": "Kalayar",
      "status": "From your contacts",
      "profile": "assets/images/eight.jpg"
    },
    {
      "name": "Than Sin May",
      "status": "From your contacts",
      "profile": "assets/images/nine.jpg"
    },
    {
      "name": "Chaw Chaw",
      "status": "Your favourite",
      "profile": "assets/images/ten.jpg"
    },
    {
      "name": "Htet Thiri San",
      "status": "From your contacts",
      "profile": "assets/images/nine.jpg"
    },
    {
      "name": "Ei Phyu",
      "status": "Your favourite",
      "profile": "assets/images/ten.jpg"
    },
  ];

  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColor.defaultBlackColor,
        leading: IconButton(
            onPressed: () {
              debugPrint("add friend");
            },
            icon: Icon(
              Icons.person_add_alt_1,
              color: AppColor.defaultWhiteColor,
              size: 30,
            )),
        centerTitle: true,
        title: Container(
          width: 150,
          height: 45,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 0;
                      });
                    },
                    child: MyTextWidget(
                      text: "Now",
                      color: selectIndex == 0
                          ? AppColor.defaultWhiteColor
                          : AppColor.secondaryTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 1;
                      });
                    },
                    child: Row(
                      children: [
                        MyTextWidget(
                          text: "Friends",
                          color: selectIndex == 1
                              ? AppColor.defaultWhiteColor
                              : AppColor.secondaryTextColor,
                          fontSize: 16.0,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        if (selectIndex != 0)
                          const Icon(
                            Icons.info_outline,
                            size: 20,
                          )
                      ],
                    ),
                  )
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                bottom: 0,
                left: selectIndex == 0 ? 5 : 90,
                child: Container(
                  width: 30.0,
                  height: 4,
                  decoration: BoxDecoration(
                      color: AppColor.defaultWhiteColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          if (selectIndex == 0)
            IconButton(
                onPressed: () {
                  debugPrint("Make Memories");
                },
                icon: Icon(
                  Icons.badge_rounded,
                  size: 30,
                  color: AppColor.defaultWhiteColor,
                )),
          IconButton(
              onPressed: () {
                debugPrint("Search button is running");
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const MyTextWidget(
              text: "Follow our friends to watch their video",
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: friends.length,
                itemBuilder: (context, int index) {
                  return Row(children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(friends[index]["profile"]),
                          radius: 30.0,
                        ),
                        title: MyTextWidget(
                          text: friends[index]["name"],
                          fontSize: 14.0,
                        ),
                        subtitle: MyTextWidget(
                          text: friends[index]["status"],
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        trailing: MyButtonWidget(
                          buttonColor: AppColor.pinking,
                          buttonText: index == 0 ? "Find" : "Follow",
                          fontSize: 12,
                          buttonTextColor: AppColor.defaultWhiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.close,
                      color: index == 0
                          ? AppColor.defaultBlackColor
                          : AppColor.secondaryTextColor,
                    ),
                  ]);

                  //End
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
