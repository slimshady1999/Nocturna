import 'package:get/get.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';

class DepositController extends GetxController {
  final showDialogController = Get.put(ShowDialog());
  final showSnackBarController = Get.put(SnackBarController());
  //-- variables

  depositController() {
    //-- Show waiting dialog..
    ShowDialog.waitingDialog();

    Future.delayed(const Duration(seconds: 10), () {
      //-- cancel dialog
      ShowDialog.cancelDialog();

      //-- show success Snack Bar
      SnackBarController.successSnackBar("Card Verification Status",
          "Your card had been verified successfully");
    });

    //-- Check for internet connectivity..

    // //-- cancel dialog
    // showDialogController.cancelDialog();

    // //-- show success Snack Bar
    // showSnackBarController.successSnackBar(
    //     "Card Verification Status", "Your card had been verified successfully");
  }
}
