import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';

class BillDashBoard extends StatelessWidget {
  const BillDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage billOnboardingPersistence = GetStorage();
    Future.delayed(const Duration(milliseconds: 1), () {
      if (billOnboardingPersistence.read("billOnboardingPersistence")) {
        return;
      } else {
        ShowDialog.billOnboardingDialog();
      }
    });
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Image.asset(
            "assets/new_logo.png",
            height: 105,
            width: 105,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.yellow,
                backgroundImage: AssetImage("assets/dp.png"),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          //-- Bill Box
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height / 5.0,
            width: double.infinity,
            child: Stack(children: [
              //-- Bill Details Card
              Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 5, left: 30, right: 37, bottom: 8),
                    height: MediaQuery.of(context).size.height / 5.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-- Total bill
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Text("Total Bill",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text("N18,000",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white)),
                          ),

                          //-- Split rate
                          Container(
                              margin: const EdgeInsets.only(top: 10, left: 15),
                              height: 25,
                              width: 44,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Icon(Icons.trending_up,
                                      color: Colors.green))),
                          //-- Split now button
                          Container(
                            height: 35,
                            margin: const EdgeInsets.only(top: 10, left: 15),
                            width: 100,
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  // controller
                                  //     .personalAccountLoginController();
                                },
                                child: Center(
                                  child: Text('Split Now',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.deepPurple)),
                                ),
                              ),
                            ),
                          ),
                        ])),
              ),

              //-- add bill
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      ShowDialog.addBillDialog();
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.deepPurple,
                          child:
                              Icon(Icons.add, color: Colors.white, size: 25)),
                    ),
                  ),
                ),
              )
            ]),
          ),

          //-- List of friends
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Near By Friends",
                    style: Theme.of(context).textTheme.bodyLarge),
                Text("See all", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 6, top: 15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/dp.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/girl.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/dp.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/girl.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/dp.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage("assets/girl.png"),
                      ),
                    ),
                  ]),
            ),
          ),

          //-- Recent Split
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Split",
                    style: Theme.of(context).textTheme.bodyLarge),
                Text("See all", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),

          //-- Card 1
          Card(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
                height: MediaQuery.of(context).size.height / 7.7,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 20,
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.yellow,
                                backgroundImage: AssetImage("assets/dp.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Transportation Fee",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  Text("july 24, 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  144, 10, 10, 10),
                                              fontSize: 10)),
                                  Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: Text("details",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10))))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text("N4000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.deepPurple)),
                            ),
                            Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text("Completed",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 10))))
                          ],
                        ),
                      )
                    ],
                  ),
                ])),
          ),

          //-- card 2
          Card(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
                height: MediaQuery.of(context).size.height / 7.7,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 20,
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.yellow,
                                backgroundImage: AssetImage("assets/dp.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("N.G.O Fee Payment",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  Text("august 24, 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  144, 10, 10, 10),
                                              fontSize: 10)),
                                  Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: Text("details",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10))))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text("N11000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.deepPurple)),
                            ),
                            Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text("canceled",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 10))))
                          ],
                        ),
                      )
                    ],
                  ),
                ])),
          )
        ])));
  }
}
