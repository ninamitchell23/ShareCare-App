import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sharecare/payments.dart';
import 'payments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fund Donation',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FundsPage(),
    );
  }
}
