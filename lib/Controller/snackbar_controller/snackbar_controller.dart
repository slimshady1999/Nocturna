import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarController extends GetxController {
  final hideDialog = ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  //-- successSnackBar
  successSnackBar(String title, String message) {
    return Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.green,
      borderRadius: 10,
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
