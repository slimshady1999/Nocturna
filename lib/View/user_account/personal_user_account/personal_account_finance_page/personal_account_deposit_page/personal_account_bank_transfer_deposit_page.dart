import 'package:flutter/material.dart';

class PersonalAccountBankTransferPage extends StatelessWidget {
  const PersonalAccountBankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Bank Transfer",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              height: 105,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Nocturna Account Number",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("9856 456 875",
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              )),
        ],
      ),
    );
  }
}
