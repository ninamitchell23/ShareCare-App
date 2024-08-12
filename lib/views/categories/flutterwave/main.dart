import 'package:flutter/material.dart';
import 'payment.dart'; // Import the PaymentForm widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set HomeScreen as the home widget
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentForm(
                  onPaymentProcessed: (success) {
                    // Handle payment processed callback here if needed
                    if (success) {
                      // Handle successful payment
                    } else {
                      // Handle failed payment
                    }
                  },
                  price: "1000", // Pass the price as needed
                ),
              ),
            );
          },
          child: Text('Go to Payment Form'),
        ),
      ),
    );
  }
}
