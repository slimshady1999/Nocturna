import 'package:flutter/material.dart';

class PersonalAccountDepositPage extends StatelessWidget {
  const PersonalAccountDepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Deposit",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 290),
            Center(
                child: Text("Coming Soon!",
                    style: Theme.of(context).textTheme.bodyLarge))
            // const SizedBox(height: 10),
            // Card(
            //   child: ListTile(
            //       leading: const CircleAvatar(
            //           radius: 19.5,
            //           backgroundColor: Color.fromARGB(255, 82, 3, 96),
            //           child: Icon(
            //             Icons.credit_card,
            //             color: Colors.white,
            //           )),
            //       title: Text("Bank Transfer",
            //           style: Theme.of(context).textTheme.bodyMedium),
            //       subtitle: Text("9856 456 875",
            //           style: Theme.of(context).textTheme.bodySmall),
            //       trailing: IconButton(
            //           onPressed: () {
            //             Get.to(() => const PersonalAccountBankTransferPage());
            //           },
            //           icon: const Icon(Icons.arrow_forward))),
            // ),
            // Card(
            //   child: ListTile(
            //       leading: const CircleAvatar(
            //           radius: 19.5,
            //           backgroundColor: Color.fromARGB(255, 82, 3, 96),
            //           child: Icon(
            //             Icons.credit_card,
            //             color: Colors.white,
            //           )),
            //       title: Text("Bank Card Transfer",
            //           style: Theme.of(context).textTheme.bodyMedium),
            //       subtitle: Text("card type",
            //           style: Theme.of(context).textTheme.bodySmall),
            //       trailing: IconButton(
            //           onPressed: () {
            //             Get.to(() => const PersonalAccountBankCardDeposit());
            //           },
            //           icon: const Icon(Icons.arrow_forward))),
            // ),
          ],
        ),
      ),
    );
  }
}
