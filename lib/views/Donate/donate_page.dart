import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/custom_container.dart';
import 'package:sharecare/common/heading.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/Donate/urgent_needs.dart';
import 'package:sharecare/views/home/widgets/category_list.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 10));
    _confettiController.play(); // Play the confetti animation on load
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(text: 'Donate', style: appStyle(12, kGray, FontWeight.w600)) ,
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              SizedBox(
                height: 100,
                width: 500,
                child: Stack(
                  children: [
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue, 
                      ),
                      child: Center(child: Text("data")),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ConfettiWidget(
                        confettiController: _confettiController,
                        blastDirectionality: BlastDirectionality.explosive,
                        shouldLoop: false,
                        colors: const [
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                          Colors.yellow,
                        ], 
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(right: 300),
                child: ReusableText(text:'Choose Your Donation', style: appStyle(16, kDark, FontWeight.bold),
              )),
              const CategoryList(),
              Heading(
                text: "Urgent Needs",
                onTap: (){
                  Get.to(() => const UrgentNeeds(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 900),
                  );
                },
              ),

            

            ],
          ),
        ),
      ),
    );
  }
}


