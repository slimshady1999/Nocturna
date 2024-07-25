import 'package:flutter/material.dart';

class PersonalAccountCallPage extends StatelessWidget {
  const PersonalAccountCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Calls",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 290),
            Center(
                child: Text("Coming Soon!",
                    style: Theme.of(context).textTheme.bodyLarge))
          ],
        ),
      ),
    );
  }
}
