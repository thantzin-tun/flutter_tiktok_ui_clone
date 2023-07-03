import 'package:flutter/material.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/DividerWidget.dart';
import 'package:flutter_widgets_testing/widgets/MyButtonWidget.dart';

import '../../widgets/MyTextWidget.dart';

class InboxViewPage extends StatefulWidget {
  const InboxViewPage({super.key});

  @override
  State<InboxViewPage> createState() => _InboxViewPageState();
}

class _InboxViewPageState extends State<InboxViewPage> {
  List<Map<String, dynamic>> friends = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.defaultWhiteColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColor.defaultWhiteColor,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget(
                text: "Inbox",
                color: AppColor.defaultBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColor.defaultWhiteColor,
                    enableDrag: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            topRight: Radius.circular(13))),
                    elevation: 1,
                    context: context,
                    builder: (context) {
                      bool switchValue = false;
                      return Container(
                        height: 465,
                        child: StatefulBuilder(
                          builder: (BuildContext context, StateSetter myState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, right: 15),
                              child: Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      //Circal Account Name Z
                                      Container(
                                        width: 130,
                                        height: 130,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 47, 86, 67),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              child: const Center(
                                                  child: MyTextWidget(
                                                text: "Z",
                                                fontSize: 60.0,
                                              )),
                                            ),

                                            //Active Circle Switch
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: AppColor
                                                        .defaultWhiteColor, // Set the border color
                                                    width:
                                                        5, // Set the border width
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: switchValue
                                                      ? AppColor.activeColor
                                                      : AppColor
                                                          .secondaryTextColor,
                                                  radius:
                                                      13, // Set the avatar image
                                                ),
                                              ),
                                            )
                                            //End Active Circle Switch
                                          ],
                                        ),
                                      ),
                                      //End circle Account Name (Z)
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      MyTextWidget(
                                        text: "Turn on activity status?",
                                        color: AppColor.defaultBlackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          ActivityInformation(
                                            text:
                                                "Show the followers you follow back that you're active now or recently active.",
                                          ),
                                          ActivityInformation(
                                            text:
                                                "You and the followers back will see each other's activity status only when both of you turn this on.",
                                          ),
                                          ActivityInformation(
                                            text:
                                                "You can manage this in Settings and privacy > Privacy.Learn more",
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AppColor.secondaryTextColor,
                                        thickness: 0.3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      //Activity Status Switch
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          MyTextWidget(
                                            text: "Activity Status",
                                            color: AppColor.defaultBlackColor,
                                            fontSize: 15.0,
                                          ),
                                          Switch(
                                            activeColor: AppColor.activeColor,
                                            activeTrackColor:
                                                Colors.greenAccent,
                                            inactiveThumbColor:
                                                AppColor.secondaryTextColor,
                                            inactiveTrackColor:
                                                AppColor.secondaryWhite,
                                            value: switchValue,
                                            onChanged: (bool value) {
                                              myState(() {
                                                switchValue = value;
                                                // changeSwitch(tru);
                                              });
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 30,
                  height: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColor.secondaryWhite),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: AppColor.secondaryTextColor,
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 15,
                          color: AppColor.secondaryTextColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: AppColor.defaultBlackColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              //Inbox Followers
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      backgroundColor: AppColor.tittokBlue,
                      radius: 28,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.group,
                          size: 32,
                          color: AppColor.defaultWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: MyTextWidget(
                            text: "New Followers",
                            color: AppColor.defaultBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          subtitle: MyTextWidget(
                            text: "cklpoenz0oq started following you",
                            color: AppColor.secondaryTextColor,
                            fontSize: 13,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColor.defaultBlackColor,
                          ),
                        ),
                        MyDividerWidget(thickness: 0.2,)
                      ],
                    ),
                  )
                ],
              ),
              //End Inbox Followers
        
              //Inbox Activites
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      backgroundColor: AppColor.tittokRed,
                      radius: 28,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.notifications,
                          size: 32,
                          color: AppColor.defaultWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: MyTextWidget(
                            text: "Activites",
                            color: AppColor.defaultBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          subtitle: MyTextWidget(
                            text: "2 people viewed your profile",
                            color: AppColor.secondaryTextColor,
                            fontSize: 13,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: AppColor.defaultBlackColor,
                          ),
                        ),
                        MyDividerWidget(thickness: 0.2,)
                      ],
                    ),
                  )
                ],
              ),
              //End Inbox Activities
        
              //Inbox System notification
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      backgroundColor: AppColor.tittokBlack,
                      radius: 28,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.system_update_alt,
                          size: 32,
                          color: AppColor.defaultWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                            title: MyTextWidget(
                              text: "System notifications",
                              color: AppColor.defaultBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            subtitle: MyTextWidget(
                              text: "TikTok: Sync contacts and settings update",
                              color: AppColor.secondaryTextColor,
                              fontSize: 12,
                            ),
                            trailing: MyTextWidget(
                              text: "4/24",
                              color: AppColor.secondaryTextColor,
                              fontSize: 14,
                            )),
                        MyDividerWidget(thickness: 0.2,)
                      ],
                    ),
                  )
                ],
              ),
              //End Inbox System Notifications

              const SizedBox(height: 20,),

              Row(
                children: [
                  MyTextWidget(
                    text: "Suggested accounts",
                    color: AppColor.defaultBlackColor,
                    fontSize: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: AppColor.defaultBlackColor,
                    size: 15,
                  )
                ],
              ),
              for (var z = 0; z < friends.length; z++)
                Row(children: [
                  Expanded(
                    child: ListTile(
                      minVerticalPadding: 0.0,
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(friends[z]["profile"]),
                        radius: 30.0,
                      ),
                      title: MyTextWidget(
                        text: friends[z]["name"],
                        fontSize: 14.0,
                        color: AppColor.defaultBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: MyTextWidget(
                        text: friends[z]["status"],
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                      trailing: MyButtonWidget(
                        buttonColor: AppColor.pinking,
                        buttonText: "Follow",
                        buttonTextColor: AppColor.defaultWhiteColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.close,
                    color: AppColor.secondaryTextColor,
                  ),
                ])
              //End
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityInformation extends StatelessWidget {
  ActivityInformation({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      contentPadding: const EdgeInsets.all(0),
      title: MyTextWidget(
        text: text,
        color: AppColor.defaultBlackColor,
        fontSize: 14,
      ),
      leading: Icon(
        Icons.circle,
        color: AppColor.defaultBlackColor,
        size: 8,
      ),
    );
  }
}
