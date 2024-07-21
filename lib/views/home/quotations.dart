import 'package:flutter/material.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';

class AllQuotations extends StatelessWidget {
  const AllQuotations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(text: 'Quotations of the Day', style: appStyle(13, kGray, FontWeight.w600),),
      ),
      body: const Center(
        child: Text('All Quotations'),
      )
    );
  }
}