import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';
import 'package:nocturna/View/intro_pages/user_role_screen.dart';
import 'package:nocturna/View/widgets/personal_account_bottom_navigation_bar.dart';

class PersonalAccountLoginController extends GetxController {
  //-- variables
  final networkManager = Get.put(NetworkManager());
  final fullnameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> personalAccountLoginKey = GlobalKey<FormState>();
  GetStorage personalAccountLoginDataPersistent = GetStorage();

  //-- Login Controller
  Future<void> personalAccountLoginController() async {
    try {
      //-- show waiting dialog
      ShowDialog.waitingDialog();

      //-- check for internet Connection
      networkManager.checkInternetConnection;

      //-- validate user form fields
      if (!personalAccountLoginKey.currentState!.validate()) {
        ShowDialog.cancelDialog();
        return;
      }

      //-- login users
      await PersonalAccountFirebaseAuthController().personalAccountLoginUser(
          emailController.text, passwordController.text);

      //-- Stop Loading dialog
      ShowDialog.cancelDialog();

      //-- Keep logged in users
      personalAccountLoginDataPersistent.write(
          "alreadyLoggedIn", "alreadyLoggedIn");

      Get.offAll(() => const PersonalAccountCustomBottomNavigationBar());

      //-- save the login data record
      // personalAccountLoginDataPersistent.write(
      //     "id", "perosonalAccountDataPersistence");
    } catch (e) {
      ShowDialog.cancelDialog();
      SnackBarController.errorSnackBar(
          title: "unable to login", message: e.toString());
    }
  }

  //-- Logout Controller
  Future<void> logOut() async {
    try {
      //-- show waiting dialog
      ShowDialog.waitingDialog();

      //-- check for internet Connection
      final isConnected = await networkManager.checkInternetConnection();
      if (!isConnected) {
        networkManager.hasConnection.value = false;
        ShowDialog.cancelDialog();
        SnackBarController.errorSnackBar(
            title: "No internet connection", message: "Please retry");
      }

      //-- logout users
      await PersonalAccountFirebaseAuthController().personalAccountLogout();

      //-- Stop Loading dialog
      ShowDialog.cancelDialog();

      Get.offAll(() => const UserRole());

      //-- Logout Sucessfully
      SnackBarController.errorSnackBar(title: "Logout", message: "Sucessfully");

      //-- save the login data record
      // personalAccountLoginDataPersistent.write(
      //     "id", "perosonalAccountDataPersistence");
    } catch (e) {
      ShowDialog.cancelDialog();
      SnackBarController.errorSnackBar(
          title: "unable to logout", message: e.toString());
    }
  }
}
