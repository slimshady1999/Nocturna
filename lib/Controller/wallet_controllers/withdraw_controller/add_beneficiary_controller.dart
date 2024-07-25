import 'package:get/get.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';

class AddBeneficiaryController extends GetxController {
  //-- Variable

  //-- add controllers (if any)
  final showDialogController = Get.put(ShowDialog());
  final snackbarController = Get.put(SnackBarController());

  addBeneficiary() {
    //-- Show waiting dialog..
    ShowDialog.waitingDialog();

    Future.delayed(const Duration(seconds: 10), () {
      //-- cancel dialog
      ShowDialog.cancelDialog();

      //-- show success Snack Bar
      SnackBarController.successSnackBar(
          "Beneficiary Status", "Beneficiary added successfully");
    });
  }
}
