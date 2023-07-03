import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets_testing/utils/colors.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class SocialStatus extends StatelessWidget {
  SocialStatus({super.key, required this.number, required this.status});

  int number;
  String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyTextWidget(
          text: number.toString(),
          color: AppColor.defaultBlackColor,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
        const SizedBox(
          height: 5,
        ),
        MyTextWidget(
          text: status,
          color: AppColor.secondaryTextColor,
          fontSize: 12.0,
        )
      ],
    );
  }
}
