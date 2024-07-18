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
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothes Donation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const Text('Select clothes category'),
              _buildClothesTypeSelector(),
              const SizedBox(height: 16.0),
              _buildClothesDetailsField(),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClothesTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Men', 'Women', 'Kids'].map((type) {
        return ChoiceChip(
          label: Text(type),
          selected: _clothesType == type,
          selectedColor: turquoise,
          onSelected: (selected) {
            setState(() {
              _clothesType = selected ? type : null;
            });
          },
        );
      }).toList(),
    );
    
  }
  Widget _buildClothesDetailsField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Clothes Details',
        hintText:
            'e.g. 1. Men\'s Shirts - 10\n2. Women\'s Dresses - 5\n3. Kids\' Jackets - 8',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the clothes details';
        }
        return null;
      },
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Quantity'),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (_quantity > 1) {
              setState(() {
                _quantity--;
              });
            }
          },
        ),
        Text('$_quantity'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _quantity++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildVehicleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Vehicle Preference'),
        Row(
          children: [
            const Icon(Icons.motorcycle),
            Radio(
              value: 'Motorcycle',
              groupValue: _vehicleType,
              onChanged: (String? value) {
                setState(() {
                  _vehicleType = value;
                });
              },
            ),
            const Icon(Icons.car_rental),
            Radio(
              value: 'Car',
              groupValue: _vehicleType,
              onChanged: (String? value) {
                setState(() {
                  _vehicleType = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWishMessageField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Add a message (optional)',
        border: OutlineInputBorder(),
      ),
      maxLines: 2,
    );
  }

  Widget _buildAnonymousSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Donate anonymously?'),
        Switch(
          value: _isAnonymous,
          onChanged: (value) {
            setState(() {
              _isAnonymous = value;
            });
          },
        ),
         // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FundsPage()),
                  );
                  },
                  child: const Text('Next'),
                ),
              ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }
}

