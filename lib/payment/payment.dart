import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  String paymentStatusMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: 'Card Number'),
            ),
            TextFormField(
              controller: cardHolderNameController,
              decoration: const InputDecoration(labelText: 'Card Holder Name'),
            ),
            TextFormField(
              controller: expirationDateController,
              decoration:
                  const InputDecoration(labelText: 'Expiration Date (MM/YY)'),
            ),
            TextFormField(
              controller: cvvController,
              decoration: const InputDecoration(labelText: 'CVV'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                processCardPayment();
              },
              child: const Text('Make Payment'),
            ),
            const SizedBox(height: 20.0),
            Text(
              paymentStatusMessage,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void processCardPayment() {
    // Simulate payment processing (in a real app, you'd integrate with a payment gateway)
    // Check if card details are valid (e.g., card number, expiration date, CVV)
    if (cardNumberController.text.isEmpty ||
        cardHolderNameController.text.isEmpty ||
        expirationDateController.text.isEmpty ||
        cvvController.text.isEmpty) {
      setState(() {
        paymentStatusMessage = 'Please fill in all card details.';
      });
      return;
    }

    // Simulate payment success
    setState(() {
      paymentStatusMessage = 'Payment successful!';
    });
  }
}
