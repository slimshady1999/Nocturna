import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/wallet_controllers/deposit_controller/deposit_controller.dart';

class PersonalAccountBankCardDeposit extends StatelessWidget {
  const PersonalAccountBankCardDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepositController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Bank Card Deposit",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Card Number
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 25),
              child: Text("Card Number",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  hintText: "Card Number Here!",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  enabled: true,
                ),
              ),
            ),

            //-- Card Expiring Date / Card CVV
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 20),
                      child: Text("Expiration Date",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 24),
                      height: 45,
                      width: 120,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 223, 223, 223),
                          hintText: "DD/YY",
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          enabled: true,
                        ),
                      ),
                    )
                  ],
                ),

                //-- Card CVV
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24, top: 20),
                      child: Text("CVV",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 24),
                      height: 45,
                      width: 120,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 223, 223, 223),
                          hintText: "546",
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          enabled: true,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            //-- Card Pin
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 20),
              child: Text("Card Pin",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  hintText: "4553",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  enabled: true,
                ),
              ),
            ),
          ],
        ),
        //-- Continue button
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
            height: 55,
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: InkWell(
                onTap: () {
                  controller.depositController();
                },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Text(
                    "Continue",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
