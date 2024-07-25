import 'package:get/get.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';

class RetryInternetConnectionController extends GetxController {
  final networkController = Get.put(NetworkManager());

  Future<void> retryInternetConnectivtiy() async {
    try {
      //-- open Dialog
      ShowDialog.waitingDialog();

      //-- check for internet access
      final isConnected = await networkController.checkInternetConnection();
      if (!isConnected) {
        networkController.hasConnection.value = false;
        ShowDialog.cancelDialog();
        ShowDialog.internetStatusChecker();
      }
      //-- reload app state
      Get.forceAppUpdate();
      //-- Stop loading
      ShowDialog.cancelDialog();
      Get.reload();
    } catch (e) {
      return;
    }
  }
}
