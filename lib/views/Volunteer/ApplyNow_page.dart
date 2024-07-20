import 'package:flutter/material.dart';
//import 'package:sharecare/common/background_container.dart';
import 'package:sharecare/constants/constants.dart';

class VolunteerForm extends StatefulWidget {
  const VolunteerForm({super.key});

  @override
  State<VolunteerForm> createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  int _selectedHours = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: kOffWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please take a few minutes to fill out this form to help us understand your availability.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text('Full Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your full name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Birth of Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your birth date (MM/DD/YYYY)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your birth date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Phone Number',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your phone number',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Address',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'How much time can you commit to volunteering per week?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  RadioListTile<int>(
                    title: const Text('Less than 5 hours per week'),
                    value: 1,
                    groupValue: _selectedHours,
                    onChanged: (value) {
                      setState(() {
                        _selectedHours = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('5-10 hours per week'),
                    value: 2,
                    groupValue: _selectedHours,
                    onChanged: (value) {
                      setState(() {
                        _selectedHours = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('10-20 hours per week'),
                    value: 3,
                    groupValue: _selectedHours,
                    onChanged: (value) {
                      setState(() {
                        _selectedHours = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text('More than 20 hours per week'),
                    value: 4,
                    groupValue: _selectedHours,
                    onChanged: (value) {
                      setState(() {
                        _selectedHours = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Hey Saran!'),
                              content: const Text(
                                  'Thank you for your interest in volunteering with us! We will let you know when there is an opportunity to volunteer.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Color.fromARGB(255, 65, 207, 193)),
                                  ),
                                  child: const Text('Return to Home Page'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Apply Now!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
