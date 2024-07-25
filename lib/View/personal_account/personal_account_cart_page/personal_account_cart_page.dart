import 'package:flutter/material.dart';

class PersonalAccountCartPage extends StatelessWidget {
  const PersonalAccountCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Settings",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 290),
          Center(
              child: Text("Coming Soon!",
                  style: Theme.of(context).textTheme.bodyLarge))
        ],
      ),
    );
  }
}
