import 'package:flutter/material.dart';
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/custom_container.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharecare/models/donation_history.dart';

final List<Donation> sampleDonations = [
  Donation(
    title: "Food Donation",
    description: "Donated canned food to local shelter",
    date: DateTime.now().subtract(const Duration(days: 1)),
    amount: 50.0,
  ),
  Donation(
    title: "Clothes Donation",
    description: "Donated clothes to charity",
    date: DateTime.now().subtract(const Duration(days: 3)),
    amount: 100.0,
  ),
];

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kOffWhite,
        title: Padding(
          padding: const EdgeInsets.only(right:40 ),
          child: Center(
            child: ReusableText(
              text: "My Donations",
              style: appStyle(18, kDark, FontWeight.w600),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("History"),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: sampleDonations.length,
                  itemBuilder: (context, index) {
                    final donation = sampleDonations[index];
                    return ListTile(
                      title: Text(donation.title),
                      subtitle: Text(donation.description),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$${donation.amount.toStringAsFixed(2)}"),
                          Text(
                            "${donation.date.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
