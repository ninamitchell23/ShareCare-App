import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:sharecare/common/app_style.dart';
import 'package:sharecare/common/reusabletext.dart';
import 'package:sharecare/constants/constants.dart';
import 'package:sharecare/views/categories/confirm_clthes.dart';
// ignore: unused_import
import 'package:sharecare/views/entrypoint.dart';

class ClothesDonationForm extends StatefulWidget {
  const ClothesDonationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClothesDonationFormState createState() => _ClothesDonationFormState();
}

class _ClothesDonationFormState extends State<ClothesDonationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clothesItemsController = TextEditingController();
  final TextEditingController _wishMessageController = TextEditingController();

  String? _selectedSource;
  String? _clothesType;
  String? _vehicleType;
  bool _isAnonymous = false;
  int _quantity = 1;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Prepare the donation data to be submitted
      Map<String, dynamic> donationData = {
        'category': 'Clothes',  
        'clothesType': _clothesType,
        'vehicleType': _vehicleType,
        'quantity': _quantity,
        'isAnonymous': _isAnonymous,
        // Add any other necessary fields here
      };

      // Call the submitDonation function to add the data to Firestore
      submitDonation(donationData);

      // Navigate to the ConfirmationPage after successful submission
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationPage2(
            selectedSource: _selectedSource,
            clothesType: _clothesType,
            vehicleType: _vehicleType,
            quantity: _quantity,
            isAnonymous: _isAnonymous, 
          ),
        ),
      );
    }
  }

  void submitDonation(Map<String, dynamic> donationData) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      donationData['userId'] = user.uid;
      donationData['donationDate'] = FieldValue.serverTimestamp(); // Ensure the timestamp is properly set

      // Add the donation data to Firestore
      FirebaseFirestore.instance.collection('donations').add(donationData).then((_) {
        // Optional: Handle post-submission logic here if needed
      }).catchError((error) {
        // Optional: Handle any errors that occur during submission
        if (kDebugMode) {
          print("Error adding donation: $error");
        }
      });
    } else {
      // Handle the case where the user is not authenticated
      if (kDebugMode) {
        print("No user is currently signed in.");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Clothes Donation",
          style: appStyle(20, kDark, FontWeight.w600),
        ),
        backgroundColor: kPrimary,
      ),
      body: Container(
        color: kOffWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text('Select Source of Clothes'),
                _buildSourceSelector(),
                const SizedBox(height: 16.0),
                const Text('Clothes Type'),
                _buildClothesTypeSelector(),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrayLight),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _buildClothesItemsField(),
                ),
                const SizedBox(height: 16.0),
                _buildQuantitySelector(),
                const SizedBox(height: 16.0),
                _buildVehicleSelector(),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryLight),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _buildWishMessageField(),
                ),
                const SizedBox(height: 16.0),
                _buildAnonymousSwitch(),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _submitForm,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSourceSelector() {
    return Wrap(
      spacing: 8.0,
      children: ['Home', 'Retailers', 'Events', 'Others'].map((source) {
        return ChoiceChip(
          label: Text(source),
          selected: _selectedSource == source,
          selectedColor: kPrimaryLight,
          onSelected: (selected) {
            setState(() {
              _selectedSource = selected ? source : null;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildClothesTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ['Men', 'Women', 'Children'].map((type) {
        return ChoiceChip(
          label: Text(type),
          selected: _clothesType == type,
          selectedColor: kPrimaryLight,
          onSelected: (selected) {
            setState(() {
              _clothesType = selected ? type : null;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildClothesItemsField() {
    return TextFormField(
      controller: _clothesItemsController,
      decoration: const InputDecoration(
        labelText: 'Clothes Items',
        hintText: 'e.g. 1. T-shirts - 10\n2. Jeans - 5\n3. Jackets - 3',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the clothes items';
        }
        return null;
      },
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Clothes Quantity'),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          color: kPrimaryLight,
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
          icon: const Icon(Icons.add_circle_outline),
          color: kPrimaryLight,
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
        const Text('Type of vehicle needed?'),
        Row(
          children: [
            const Icon(Icons.pedal_bike),
            Radio(
              value: 'Bike',
              groupValue: _vehicleType,
              onChanged: (String? value) {
                setState(() {
                  _vehicleType = value;
                });
              },
              activeColor: kPrimaryLight,
            ),
            const Icon(Icons.directions_car),
            Radio(
              value: 'Car',
              groupValue: _vehicleType,
              onChanged: (String? value) {
                setState(() {
                  _vehicleType = value;
                });
              },
              activeColor: kPrimaryLight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWishMessageField() {
    return TextFormField(
      controller: _wishMessageController,
      decoration: const InputDecoration(
        labelText: 'Do you want to send a wish message?',
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
          activeColor: kPrimaryLight,
        ),
      ],
    );
  }
}
