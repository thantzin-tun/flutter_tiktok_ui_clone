import 'package:flutter/material.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/CustomSizeBox.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget text = MyTextWidget(
      text: "Terms of Service",
      color: AppColor.defaultBlackColor,
      fontSize: 14.0,
    );
    return Scaffold(
      backgroundColor: AppColor.secondaryWhite,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
          color: AppColor.secondaryTextColor,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                debugPrint("Help");
              },
              icon: Icon(
                Icons.help_outline,
                color: AppColor.secondaryTextColor,
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 0.1, color: AppColor.secondaryTextColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyTextWidget(
                text: "Already have and account?",
                color: AppColor.defaultBlackColor,
                fontSize: 16.0,
              ),
              Gap(
                w: 5.0,
              ),
              MyTextWidget(
                text: "Log in",
                color: AppColor.tittokRed,
                fontSize: 16.0,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 50.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyTextWidget(
              text: "Sign up for TikTok",
              color: AppColor.defaultBlackColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            Gap(
              h: 15,
            ),
            MyTextWidget(
              text:
                  "Create a profile,follow other accounts, make your own videos, and more.",
              color: AppColor.secondaryTextColor,
              fontSize: 14.0,
              textAlign: true,
            ),
            Gap(
              h: 30,
            ),
            LoginMethod(
              method: "Use phone or email",
              image: "assets/images/user.png",
            ),
            Gap(
              h: 15,
            ),
            LoginMethod(
              method: "Continue with Facebook",
              image: "assets/images/facebooks.png",
            ),
            Gap(
              h: 15,
            ),
            LoginMethod(
              method: "Continue with Google",
              image: "assets/images/google.png",
            ),
            Gap(
              h: 15,
            ),
            LoginMethod(
              method: "Continue with Twitter",
              image: "assets/images/twitter.png",
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By continuing, you agree to our ',
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: AppColor.secondaryTextColor,
                      fontSize: 14.0,
                      decoration: TextDecoration.none,
                      fontFamily: "Proxima",
                      fontWeight: FontWeight.normal,

                      // Set the text color to red
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms of Service ',
                    style: TextStyle(
                        color: AppColor
                            .defaultBlackColor), // Set the text color to black
                  ),
                  const TextSpan(
                    text: 'and acknowledge that you have read our ',
                    // Set the text color to black
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        color: AppColor
                            .defaultBlackColor), // Set the text color to black
                  ),
                  const TextSpan(
                    text: ' to learn how we collect,use, and share your data',
                    // Set the text color to black
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginMethod extends StatelessWidget {
  String method;
  String image;
  LoginMethod({super.key, required this.method, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.3,
                color: AppColor.secondaryTextColor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              width: 25,
            ),
            Expanded(
              child: MyTextWidget(
                text: method,
                color: AppColor.defaultBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                textAlign: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
