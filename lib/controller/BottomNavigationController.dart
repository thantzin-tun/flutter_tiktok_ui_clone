import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

import '../screen/friends/Friend.dart';
import '../screen/home/HomeScreen.dart';
import '../screen/home/Upload.dart';
import '../screen/inbox/Inbox.dart';
import '../screen/profile/Profile.dart';


class NavigationController extends GetxController {
    List<Widget> navigationPage = [
    const HomeScreen(),
    const FriendViewPage(),
    const UploadScreenWidget(),
    const InboxViewPage(),
    const ProfileViewPage()
  ];
  
  int currentIndexPage = 0;
    
    void changeIndex(int index) {
      currentIndexPage = index;
      update();
    }
}