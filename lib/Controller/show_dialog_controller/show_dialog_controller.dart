import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/Controller/internet_connection_controller/retry_internet_connection_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';

class ShowDialog extends GetxController {
  //-- Waiting Dialog
  static waitingDialog() {
    return showDialog(
        context: Get.context!,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(36, 158, 158, 158),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.secondary),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(width: 10.5),

                          //-- Text
                          Text("Processing",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white))
                        ]),
                  )
                ],
              ),
            ));
  }

  //-- Success Dialog
  static successDialog() {
    return showDialog(
        context: Get.context!,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(32, 158, 158, 158),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Processing...",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
            ));
  }

  //-- no internet connection Dialog
  static internetStatusChecker() {
    return showDialog(
        context: Get.context!,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/internet.png"),

                  //-- Text
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Slow or No Internet Access",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(
                    height: 100,
                  ),

                  Container(
                      margin: const EdgeInsets.only(left: 100, right: 100),
                      height: 50,
                      width: double.infinity,
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).colorScheme.secondary,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            final controller =
                                Get.put(RetryInternetConnectionController());
                            controller.retryInternetConnectivtiy();
                          },
                          borderRadius: BorderRadius.circular(25),
                          child: Center(
                            child: Text("Retry",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white)),
                          ),
                        ),
                      ))
                ],
              ),
            ));
  }

  //-- Chat Onboarding Dialog
  static chatOnboardingDialog() {
    GetStorage chatOnboardingPersistence = GetStorage();
    return showDialog(
        context: Get.context!,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  //-- Images
                  Container(
                      color: const Color.fromARGB(37, 104, 58, 183),
                      width: double.infinity,
                      child: const Column(children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage:
                                      AssetImage("assets/chatting.jpeg"),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 120, right: 15),
                                child: CircleAvatar(
                                  radius: 85,
                                  backgroundImage:
                                      AssetImage("assets/chat3.jfif"),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 210, bottom: 15, left: 30),
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage: AssetImage(
                                    "assets/chat4.png",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])),

                  //--- Texts
                  const SizedBox(height: 40),
                  Text("Enjoy the new experiences of",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("chatting with friends",
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 13.5),
                  Text(
                      textAlign: TextAlign.center,
                      "Connect with friends, share moments together with end-to-end security",
                      style: Theme.of(context).textTheme.bodyMedium),

                  //-- Button
                  const SizedBox(height: 50),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    width: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () {
                          chatOnboardingPersistence.write(
                              "chatOnboardingPersistence",
                              "chatOnboardingPersistence");
                          cancelDialog();
                        },
                        child: Center(
                          child: Text('Get Started',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  //-- Chat Onboarding Dialog
  static billOnboardingDialog() {
    GetStorage billOnboardingPersistence = GetStorage();
    return showDialog(
        context: Get.context!,
        builder: (context) => Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  //-- Images
                  Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images (17).jpeg")))),

                  //--- Texts
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Column(children: [
                      Text("Easily Split Bills",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.purple)),
                      Text("with friends and track",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("spending",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 13.5),
                      Text(
                          textAlign: TextAlign.center,
                          "Bringing simplicity and joy to manage your expences, one split bill at a time!",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ]),
                  ),

                  //-- Button
                  const SizedBox(height: 50),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    width: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () {
                          billOnboardingPersistence.write(
                              "billOnboardingPersistence",
                              "billOnboardingPersistence");
                          cancelDialog();
                        },
                        child: Center(
                          child: Text('Get Started',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

//-- add bill Password
  static addBillDialog() {
    return showDialog(
        context: Get.context!,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 210),
                        height: MediaQuery.of(context).size.height / 2.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(children: [
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text('Add Billing Below',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.only(right: 24, left: 24),
                            child: TextField(
                              // controller: controller.emailController,
                              cursorColor: Colors.black,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 223, 223, 223),
                                hintText: 'Name of bill',
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 24, left: 24, top: 15),
                            child: TextField(
                              // controller: controller.emailController,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 223, 223, 223),
                                hintText: 'Amount',
                                hintStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),

                          //-- Create bill button
                          const SizedBox(height: 24),
                          Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            height: 60,
                            width: double.infinity,
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.deepPurple,
                              child: InkWell(
                                onTap: () {
                                  waitingDialog();
                                  Future.delayed(
                                          const Duration(seconds: 1), () {})
                                      .then((value) {
                                    cancelDialog();
                                    SnackBarController.successSnackBar(
                                        "Bill Created",
                                        "Your Bill is ready to split");
                                  });
                                },
                                child: Center(
                                  child: Text('Create Bill',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white)),
                                ),
                              ),
                            ),
                          ),
                        ]))
                  ],
                ),
              ),
            ));
  }

  static cancelDialog() {
    Get.back();
  }
}
