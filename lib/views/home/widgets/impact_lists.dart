import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/constants/uidata.dart';
import 'package:sharecare/views/home/widgets/impact_widgets.dart';


class ImpactLists extends StatelessWidget {
  const ImpactLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(impacts.length, (i) {
          var impact = impacts[i];
          return ImpactWidgets(
             title: impact['title'],
             image: impact['imageUrl'],
             time: impact['time'],
             description: impact['description'],
             );
        },
      )
    ));
  }
}