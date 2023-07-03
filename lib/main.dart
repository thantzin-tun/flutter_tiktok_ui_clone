// import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_testing/controller/BottomNavigationController.dart';
import 'package:flutter_widgets_testing/screen/friends/Friend.dart';
import 'package:flutter_widgets_testing/screen/home/HomeScreen.dart';
import 'package:flutter_widgets_testing/screen/inbox/Inbox.dart';
import 'package:flutter_widgets_testing/screen/master/MasterPage.dart';
import 'package:flutter_widgets_testing/screen/profile/MyQRCode.dart';
import 'package:flutter_widgets_testing/screen/profile/Profile.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_widgets_testing/screen/profile/ProfileSettingsandPrivacy.dart';
import 'package:flutter_widgets_testing/splashScreen.dart';
import 'package:flutter_widgets_testing/testing.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

void main() {
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  NavigationController controller = Get.put(NavigationController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "Proxima"),
      debugShowCheckedModeBanner: false,
      title: 'TikTok Ui',
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TodoBloc todoBloc = TodoBloc();
  final formKey = GlobalKey<FormState>();

  String? todoName, description;

  void myFunc(String message) {
    debugPrint(message);
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveTestingWidgets();
  }
}
