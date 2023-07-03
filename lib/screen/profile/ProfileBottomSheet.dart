import 'package:flutter/material.dart';
import 'package:flutter_widgets_testing/screen/profile/CreaterTools.dart';
import 'package:flutter_widgets_testing/screen/profile/MyQRCode.dart';
import 'package:flutter_widgets_testing/screen/profile/ProfileSettingsandPrivacy.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

Color isSplashColor = Colors.transparent;

List<String> modalMenu = [
  "Creator tools",
  "My QR code",
  "Settings and privacy"
];

List<IconData> modalIcon = [
  Icons.person_pin,
  Icons.qr_code_sharp,
  Icons.settings_outlined,
];

Future<dynamic> ShowModalBottomSheetWidget(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: AppColor.defaultWhiteColor,
    enableDrag: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13), topRight: Radius.circular(13))),
    elevation: 1,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 20,
        ),
        height: 185,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: modalMenu.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              thickness: 0.3,
              height: 0,
              color: AppColor.secondaryTextColor,
            ),
          ),
          itemBuilder: (context, int index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                switch (index) {
                  case 0:
                    Get.to(() => CreaterTools());
                    break;
                  case 1:
                    Get.to(() => const MyQRCodeScreen());

                    break;
                  case 2:
                    Get.to(() => SettingsAndPrivacyScreen());

                    break;
                }
              },
              onLongPress: () {},
              child: ListTile(
                tileColor: isSplashColor,
                contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                title: MyTextWidget(
                  text: modalMenu[index],
                  color: AppColor.defaultBlackColor,
                  fontSize: 15,
                ),
                leading: Icon(
                  modalIcon[index],
                  color: AppColor.defaultBlackColor,
                  size: 26,
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
