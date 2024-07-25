import 'package:flutter/material.dart';

class BillSplitterScreen extends StatefulWidget {
  const BillSplitterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BillSplitterScreenState createState() => _BillSplitterScreenState();
}

class _BillSplitterScreenState extends State<BillSplitterScreen> {
  List<Friend> friends = [
    Friend(name: 'Friend 1', selected: false),
    Friend(name: 'Friend 2', selected: false),
    Friend(name: 'Friend 3', selected: false),
    Friend(name: 'Friend 4', selected: false),
    Friend(name: 'Friend 5', selected: false),
    Friend(name: 'Friend 6', selected: false),
    Friend(name: 'Friend 7', selected: false),
    Friend(name: 'Friend 8', selected: false),
    Friend(name: 'Friend 9', selected: false),
    Friend(name: 'Friend 10', selected: false),
    // Add more friends as needed
  ];

  double totalBillAmount = 100.00;
  double perPersonAmount = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Splitter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Bill Amount: \$${totalBillAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(friends[index].name),
                  trailing: Checkbox(
                    value: friends[index].selected,
                    onChanged: (value) {
                      setState(() {
                        friends[index].selected = value!;
                        calculatePerPersonAmount();
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Amount Per Person: \$${perPersonAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showThankYouDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calculatePerPersonAmount() {
    int selectedFriendsCount =
        friends.where((friend) => friend.selected).length;
    if (selectedFriendsCount > 0) {
      perPersonAmount = totalBillAmount / selectedFriendsCount;
    } else {
      perPersonAmount = 0.00;
    }
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You!'),
          content: const Text(
              'Payment has been completed. Thank you for using our service.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Friend {
  final String name;
  bool selected;

  Friend({
    required this.name,
    required this.selected,
  });
}
