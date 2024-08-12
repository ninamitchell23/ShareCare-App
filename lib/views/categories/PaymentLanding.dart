import 'package:flutter/material.dart';



class PaymentOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Payment Method'
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayPalPaymentPage(),
                  ),
                );
              },
              child: Image.asset('assets/images/paypal_logo.png', height: 100),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlutterwavePaymentPage(),
                  ),
                );
              },
              child: Image.asset('assets/images/flutterwave_logo.png', height: 100),
            ),
            SizedBox(height: 20),
            //no redirect
            Image.asset('assets/images/mobilemoney_logo.png', height: 100),
            SizedBox(height: 20),
            
            Image.asset('assets/images/airtelmoney_logo.png', height: 100),
            SizedBox(height: 20),
            
            Image.asset('assets/images/_logo.png', height: 100),
            SizedBox(height: 20),
            
            Image.asset('assets/images/visacard_logo.png', height: 100),
          ],
        ),
      ),
    );
  }
}
