import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessAccountRegisterationDialog {
  //-- Coming Soon Dialog
  static comingSoonDialog() {
    // final controller = Get.put(PersonalAccountLoginController());
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
                            left: 20, right: 20, top: 200),
                        height: MediaQuery.of(context).size.height / 2.9,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(right: 15, top: 20),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.cancel,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ]),
                          const SizedBox(height: 50),
                          Text(
                            'Coming Soon!',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ]))
                  ],
                ),
              ),
            ));
  }
}
