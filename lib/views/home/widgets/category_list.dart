import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/constants/uidata.dart';
import 'package:sharecare/controllers/category_controller.dart';
import 'package:sharecare/views/categories/all_categories.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      height: 75.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h ),
      
      child: ListView(
        
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (i) {
          var category = categories[i];
          return GestureDetector( 
            onTap: (){
              if (controller.categoryValue == category['_id']){
                controller.updateCategory='';
                controller.updateTitle='';
              }else if(category['value'] == 'more') {
                Get.to(()=> const AllCategories(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds:900 )
                );
              }
              else{
                controller.updateCategory=category['_id'];
                controller.updateTitle=category['title'];
              }
            },
            child: Obx(() =>  Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 10.h),
            width: width*0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: controller.categoryValue == category['_id'] ? kSecondary : kOffWhite, width: .5.w)
            ),

            

            child: Column(
              
              children: [
                SizedBox(
                  height: 30.h,
                  child: Image.asset(category['imageUrl'], fit: BoxFit.contain,),
                ),
                ReusableText(text: category["title"], style: appStyle(12, kDark, FontWeight.normal))
              ],
            ),

          ),
        ));
        } ),
      ),
    );
  }
}