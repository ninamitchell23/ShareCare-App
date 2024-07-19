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

class FundsPage extends StatefulWidget {
  @override
  _FundsPageState createState() => _FundsPageState();
}

class _FundsPageState extends State<FundsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  List<double> _mostDonatedAmounts = [10000.0, 20000.0, 50000.0, 100000.0];
  String _selectedCurrency = 'UGX'; // Default currency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Donation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
