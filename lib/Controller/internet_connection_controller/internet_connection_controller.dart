import 'dart:io';
import 'package:get/get.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';

class NetworkManager extends GetxController {
  //-- variables
  Rx<bool> hasConnection = false.obs;

  //-- function to check for internet connection
  Future<bool> checkInternetConnection() async {
    try {
      final internetConnection = await InternetAddress.lookup('www.google.com');
      if (internetConnection.isNotEmpty &&
          internetConnection[0].rawAddress.isNotEmpty) {
        return hasConnection.value = true;
      } else {
        return hasConnection.value = false;
      }
    } on SocketException catch (_) {
      hasConnection.value = false;
      ShowDialog.internetStatusChecker();
    }
    return hasConnection.value;
  }
}
