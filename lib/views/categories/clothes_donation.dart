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

