import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarController extends GetxController {
  final hideDialog = ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  //-- successSnackBar
  static successSnackBar(String title, String message) {
    return Get.showSnackbar(GetSnackBar(
      forwardAnimationCurve: Curves.ease,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 50),
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      borderRadius: 30,
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  //-- errorSnackBar
  static errorSnackBar({required String title, required String message}) {
    return Get.showSnackbar(GetSnackBar(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 50),
      title: title,
      message: message,
      snackStyle: SnackStyle.FLOATING,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      borderRadius: 30,
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
