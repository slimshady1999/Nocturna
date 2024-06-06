import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_finance_page/personal_account_withdrawal_page/personal_account_add_beneficiary.dart';

class PersonalAccountWithdrawalPage extends StatelessWidget {
  const PersonalAccountWithdrawalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Withdrawal",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Amount section
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Amount",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 45, right: 45, top: 25),
              height: 80,
              width: double.infinity,
              child: TextField(
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "N8000",
                    filled: true,
                    fillColor: const Color.fromARGB(51, 223, 223, 223),
                    hintStyle: Theme.of(context).textTheme.titleLarge,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),

            //-- add beneficiaries
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text(
                        "Add Beneficiary",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.arrow_forward, size: 20)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PersonalAccountAddBeneficiary());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 52,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add Beneficiary",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //--  Beneficiaries
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 60),
              child: Text("Beneficiaries",
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(
              height: 20,
            ),
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
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
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
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("H",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("Harmony Marry",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text("Wema Bank",
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
              ),
            ),
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
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
              ),
            ),

            //-- Continue button
            Container(
              margin: const EdgeInsets.only(
                  left: 24, right: 24, bottom: 5, top: 30),
              height: 55,
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: InkWell(
                  onTap: () {
                    // controller.depositController();
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
          ],
        ),
      ),
    );
  }
}
