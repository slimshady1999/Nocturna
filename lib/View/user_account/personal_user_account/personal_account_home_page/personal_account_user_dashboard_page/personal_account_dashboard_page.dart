import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_cart_page/personal_account_cart_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_finance_page/personal_account_deposit_page/personal_account_deposit_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_finance_page/personal_account_withdrawal_page/personal_account_withdrawal_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_transactions/personal_account_transactions_history.dart';
import 'package:nocturna/View/widgets/bottom_chat_bar.dart';

class PersonalAccountDashboard extends StatelessWidget {
  const PersonalAccountDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset("assets/logo_new.png", height: 105, width: 105),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Stack(children: [
                const Positioned(
                    left: 27,
                    top: 7,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.red,
                    )),
                IconButton(
                    onPressed: () {
                      Get.to(() => const BottomChatBar());
                    },
                    icon: const Icon(Icons.chat,
                        size: 18, color: Color.fromARGB(255, 82, 3, 96))),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 18.5,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Stack(children: [
                const Positioned(
                    left: 25,
                    top: 8,
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.red,
                    )),
                IconButton(
                    onPressed: () {
                      Get.to(() => const PersonalAccountCartPage());
                    },
                    icon: const Icon(Icons.shopping_bag,
                        size: 18, color: Colors.white)),
              ]),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //-- User Name and Image
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/splash.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                        Text(
                          "Douglas Ibiba",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //-- Balance Section
            Container(
              margin: const EdgeInsets.only(
                  left: 24, right: 24, top: 18, bottom: 10),
              height: MediaQuery.of(context).size.height / 4.9,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 82, 3, 96),
                    Color.fromARGB(255, 16, 4, 18)
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current Balance",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: TextButton(
                            onPressed: () {
                              Get.to(() =>
                                  const PersonalAccountTransactionHistory());
                            },
                            child: Text(
                              "Transaction History",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        'N5000', // Replace with actual wallet balance
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),

                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      //-- Deposit Button
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PersonalAccountDepositPage());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15, top: 20),
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(122, 243, 188, 253)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 4, right: 7),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              Text("Deposit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      ),

                      //-- Withdraw Button
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PersonalAccountWithdrawalPage());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15, top: 20),
                          height: 40,
                          width: 123,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(122, 243, 188, 253)),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 4, right: 7),
                                child: Icon(Icons.arrow_downward,
                                    color: Colors.white),
                              ),
                              Text("withdraw",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //-- Transactions History
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 2.1,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: Text("Transactions",
                          style: Theme.of(context).textTheme.bodyMedium),
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
                        trailing: Text("N 8000",
                            style: Theme.of(context).textTheme.bodyMedium),
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
                        trailing: Text("N 2000",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
