import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialog extends GetxController {
  //-- Waiting Dialog
  waitingDialog() {
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
                    height: 16,
                  ),
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ],
              ),
            ));
  }

  //-- Success Dialog
  successDialog() {
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

  cancelDialog() {
    return Get.back();
  }
}
