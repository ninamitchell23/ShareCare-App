import 'package:flutter/material.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';

class UrgentNeeds extends StatelessWidget {
  const UrgentNeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "Urgent Needs", style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: Center(
        child: ReusableText(text: "Nina", style: appStyle(12, Colors.black, FontWeight.normal)),
      ),
    );
  }
}