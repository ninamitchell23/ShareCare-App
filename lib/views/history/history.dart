import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("My Donation History")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("donations")
            .where("userId", isEqualTo: user?.uid)
            .orderBy("donationDate", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Donations found"),
            );
          }

          final donations = snapshot.data!.docs;

          return ListView.builder(
            itemCount: donations.length,
            itemBuilder: (context, index) {
              final donation = donations[index];
              final category = donation["category"];
              final Timestamp timestamp = donation["donationDate"];
              final date = DateFormat.yMMMd().add_jm().format(timestamp.toDate());
              final quantity = donation["quantity"];

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: $category', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Donation Date: $date'),
                      Text('Quantity: $quantity'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
