import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/constants/uidata.dart';
import 'package:sharecare/views/home/widgets/urgentneeds_widget.dart';

class UrgentNeedsList extends StatelessWidget {
  const UrgentNeedsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(urgentneeds.length, (i) {
          var urgentneed = urgentneeds[i];
          return UrgentneedsWidget(
            image: urgentneed['imageUrl'],
             title: urgentneed['title'],
                time: urgentneed['time'],
                 rating: urgentneed['rating'],
                  logo: urgentneed['imageUrl']
                  );
        },
      )
    ));
  }
}