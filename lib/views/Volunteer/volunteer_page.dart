import 'package:flutter/material.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart'; // Import the constants
import 'package:sharecare/views/Volunteer/ApplyNow_page.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: kOffWhite, // Set the background color from your constants
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/volunteer.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'We grow by helping others',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VolunteerForm()),
                          );
                          // Navigate to the apply now screen
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: ReusableText(
                          text: "Apply Now",
                          style: appStyle(16, Colors.teal, FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Why sign up as a volunteer?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Becoming a volunteer can offer a multitude of benefits both for the individual and the community. By volunteering, you can make a positive impact in your community and help those in need. It provides a sense of purpose, satisfaction and fulfillment knowing that you have contributed to making someone else’s life better.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Additionally, volunteering can help to develop new skills, gain work experience, and build networks with like-minded individuals.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
