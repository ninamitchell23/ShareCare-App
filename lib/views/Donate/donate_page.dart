// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/custom_container.dart';
import 'package:sharecare/common/heading.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/Donate/bannercontainer.dart';
import 'package:sharecare/views/home/urgent_needs.dart';
import 'package:sharecare/views/home/widgets/category_list.dart';
import 'package:sharecare/views/home/widgets/urgent_needs_list.dart';
import 'package:sharecare/views/Donate/banner_button.dart';
import 'package:sharecare/views/history/history_page.dart';


class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter += 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: "Donate",
            style: appStyle(18, kDark, FontWeight.w600),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Bannercontainer(
                  containerContents: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ReusableText(
                            text: "Lives you have impacted",
                            style: appStyle(13, kOffWhite, FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Lottie.asset(
                                'assets/anime/handwithlove.json',
                                height: 100,
                                width: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:40),
                                child: Text(
                                  '$counter',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kOffWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: ReusableText(
                            text: "Total Donations-",
                            style: appStyle(13, kOffWhite, FontWeight.bold),
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                                Navigator.push( 
                                  context, 
                                  MaterialPageRoute( 
                                  builder: (context) => HistoryPage()));
                              }, 
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 165),
                child: ReusableText(
                  text: "Choose Your Donation",
                  style: appStyle(16, kDark, FontWeight.bold),
                ),
              ),
              const CategoryList(),
              Heading(
                text: "Urgent Needs",
                onTap: () {
                  Get.to(
                    () => const AllUrgentNeeds(),
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
