import 'package:flutter/material.dart';
import 'package:nocturna/payment/payment.dart';
import 'bill_splitter.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment Brokerage Bills'),
      ),
      body: ListView(
        children: [
          BillCard(
            title: 'Event Booking',
            amount: 500.00,
            dueDate: 'Due: October 15, 2023',
          ),
          BillCard(
            title: 'Artist Payment',
            amount: 1000.00,
            dueDate: 'Due: October 20, 2023',
          ),
          BillCard(
            title: 'Venue Rental',
            amount: 800.00,
            dueDate: 'Due: November 1, 2023',
          ),
          // Add more BillCard widgets as needed for different bills related to Entertainment Brokerage Hub
        ],
      ),
    );
  }
}

class BillCard extends StatelessWidget {
  final String title;
  final double amount;
  final String dueDate;

  BillCard({
    super.key,
    required this.title,
    required this.amount,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Amount: \$${amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              dueDate,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button color
                  ),
                  child: const Text(
                    'Pay Bill',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BillSplitterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button color
                  ),
                  child: const Text(
                    'Split Bill',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
