import 'package:flutter/material.dart';
import 'package:sharecare/funds.dart';

class ClothesDonationForm extends StatefulWidget {
  const ClothesDonationForm({super.key});

  @override
  _ClothesDonationFormState createState() => _ClothesDonationFormState();
}

class _ClothesDonationFormState extends State<ClothesDonationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupDateController = TextEditingController();
  final TextEditingController _preferredTimeController = TextEditingController();

  String? _selectedSource;
  String? _clothesType;
  String? _vehicleType;
  bool _isAnonymous = false;
  int _quantity = 1;

  final Color turquoise = Colors.teal;
