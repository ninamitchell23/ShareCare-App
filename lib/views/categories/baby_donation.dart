import 'package:flutter/material.dart';

import 'package:sharecare11/funds.dart';  // Ensure the file name matches

class BabyDonationForm extends StatefulWidget {
  const BabyDonationForm({super.key});

  @override
  _BabyDonationFormState createState() => _BabyDonationFormState();
}

class _BabyDonationFormState extends State<BabyDonationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupDateController = TextEditingController();
  final TextEditingController _preferredTimeController = TextEditingController();

  String? _selectedSource;
  String? _booksType;
  String? _vehicleType;
  bool _isAnonymous = false;
  int _quantity = 1;

  final Color turquoise = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Babycare Donation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const Text('Select items to donate'),
              _buildBabyTypeSelector(),
              const SizedBox(height: 16.0),
              _buildBabyDetailsField(),
              const SizedBox(height: 16.0),
              _buildQuantitySelector(),
              const SizedBox(height: 16.0),
              _buildVehicleSelector(),
              const SizedBox(height: 16.0),
              _buildWishMessageField(),
              const SizedBox(height: 16.0),
              _buildAnonymousSwitch(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Donate'),

              ),
            
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => FundsPage()),
                    
              //       );
              //     },
              //     child: Text('go to funds donation'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBabyTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['pampers', 'babyfood', 'toys', 'clothes'].map((type) {
        return ChoiceChip(
          label: Text(type),
          selected: _booksType == type,
          selectedColor: turquoise,
          onSelected: (selected) {
            setState(() {
              _booksType = selected ? type : null;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildBabyDetailsField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Edit some details',
        hintText:
            'e.g. powdered milk (5tins or packets)',
        border: OutlineInputBorder(),
      ),
