import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/custom_container.dart';
import 'package:sharecare/common/heading.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/Donate/widgets/widgets/bannercontainer.dart';
import 'package:sharecare/views/home/urgent_needs.dart';
import 'package:sharecare/views/home/widgets/category_list.dart';
import 'package:sharecare/views/home/widgets/urgent_needs_list.dart';


class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
          // preferredSize: Size.fromHeight(130.h),
          title: ReusableText(text: "Donate", style: appStyle(12, kGray, FontWeight.w600))),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Bannercontainer(containerContents: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ReusableText(text: "Choose Your Donation", style: appStyle(10, kDark, FontWeight.bold)),
                    )),),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: ReusableText(text: "Choose Your Donation", style: appStyle(16, kDark, FontWeight.bold)),
                ),


                const CategoryList(),

                Heading(
                text: "Urgent Needs",
                onTap: () {
                  Get.to(() => const AllUrgentNeeds(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900),
                  );
                },
                ),
                const UrgentNeedsList(),

              

               


              ],
              ),
          
        ),
      ),
    );
  }
}
