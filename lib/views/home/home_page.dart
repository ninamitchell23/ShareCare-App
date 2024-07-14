import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecare/common/custom_appbar.dart';
import 'package:sharecare/common/custom_container.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const CustomAppbar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: 
            Column(
              children: [
                CategoryList()
              ],
              ),
          
        ),
      ),
    );
  }
}
