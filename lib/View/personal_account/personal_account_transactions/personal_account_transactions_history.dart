import 'package:flutter/material.dart';

class PersonalAccountTransactionHistory extends StatelessWidget {
  const PersonalAccountTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 96),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Transactions",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("M",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("John Doe",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text("Fist Bank Plc",
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: Text("N 2000",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("B",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("Bassey John",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text("Opay Digital Service",
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: Text("N 6700",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
