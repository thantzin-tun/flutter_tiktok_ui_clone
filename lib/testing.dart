import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_widgets_testing/widgets/MyTextWidget.dart';

class ResponsiveTestingWidgets extends StatefulWidget {
  const ResponsiveTestingWidgets({super.key});

  @override
  State<ResponsiveTestingWidgets> createState() => _ResponsiveTestingWidgetsState();
}

class _ResponsiveTestingWidgetsState extends State<ResponsiveTestingWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyTextWidget(text: "Responsive",),
      ),
    );
  }
}