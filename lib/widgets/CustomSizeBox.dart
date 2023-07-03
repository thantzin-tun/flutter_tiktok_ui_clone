import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gap extends StatelessWidget {
  double? w;
  double? h;

  Gap({super.key, this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w ?? 0.0, height: h ?? 0.0);
  }
}
