import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/wallet_controllers/withdraw_controller/add_beneficiary_controller.dart';

class PersonalAccountAddBeneficiary extends StatelessWidget {
  const PersonalAccountAddBeneficiary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddBeneficiaryController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Add Beneficiary",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("Select Bank",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(82, 158, 158, 158),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select Bank",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Icon(Icons.arrow_downward)
                ],
              ),
            ),
          ),

          //-- Add Account Number
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text("Input Account Number",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              height: 65,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(82, 158, 158, 158),
                    hintText: "7654-564-456",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              )),

          //-- Confirm button
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 50),
            height: 55,
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: InkWell(
                onTap: () {
                  controller.addBeneficiary();
                },
                borderRadius: BorderRadius.circular(20),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
