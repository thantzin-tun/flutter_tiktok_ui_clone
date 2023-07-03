// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyDividerWidget extends StatelessWidget {

  double thickness;
  MyDividerWidget({
    Key? key,
    this.thickness = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: thickness,color: AppColor.secondaryTextColor,);
  }
}
