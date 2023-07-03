import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class UploadScreenWidget extends StatelessWidget {
  const UploadScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyTextWidget(text:"Upload with camera"),
    );
  }
}