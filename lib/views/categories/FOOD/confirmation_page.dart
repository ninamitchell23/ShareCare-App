import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharecare/views/entrypoint.dart';
import 'package:sharecare/views/tracker/pickup1.dart';

class ConfirmationPage extends StatelessWidget {
  final String? selectedSource;
  final String? foodType;
  final String? vehicleType;
  final int quantity;
  final bool isAnonymous;

  const ConfirmationPage({
    super.key,
    required this.selectedSource,
    required this.foodType,
    required this.vehicleType,
    required this.quantity,
    required this.isAnonymous,
  });

  Future<void> _submitDonation(BuildContext context) async {
    final donation = {
      'source': selectedSource,
      'category':'Food',
      'foodType': foodType,
      'quantity': quantity,
      'vehicleType': vehicleType,
      'isAnonymous': isAnonymous,
      'donationDate': DateTime.now(),
    };

    await FirebaseFirestore.instance.collection('donations').add(donation);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your donation!')),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54, // to simulate a modal overlay
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildConfirmationDetails(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _submitDonation(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.tealAccent),
                    ),
                    child: const Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) =>
                          const SetPickupLocationPage()),);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Proceed to Pickup'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Column(
            children: [
              Icon(
                Icons.assignment_turned_in,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(height: 8),
              Text(
                'Please Confirm',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Donation Category', 'Food'),
        _buildDetailRow('Food Type', foodType),
        _buildDetailRow('Source of Food', selectedSource),
        _buildDetailRow('Food Quantity', '$quantity people Approx.'),
        _buildDetailRow('Charity Organization', 'Goodwill Charity'),
        _buildDetailRow('Vehicle Type', vehicleType),
        _buildDetailRow('You have chosen to donate anonymously', isAnonymous ? 'Yes' : 'No'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            value ?? '',
            style: const TextStyle(fontSize: 18, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
