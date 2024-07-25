import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_cloud_firestore_controller.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';
import 'package:nocturna/Model/personal_account_users_model.dart';
import 'package:nocturna/View/widgets/personal_account_bottom_navigation_bar.dart';

class PersonalAccountRegisterController extends GetxController {
  //-- variables
  final networkManager = Get.put(NetworkManager());
  final firestoreController =
      Get.put(PersonalAccountFirebaseFirestoreController());
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> personalAccountRegisterKey = GlobalKey<FormState>();
  final personalAccountRegisterDataPersistent = GetStorage();

  //-- Register Controller
  Future<void> personalAccountRegisterController() async {
    try {
      //-- show waiting dialog
      ShowDialog.waitingDialog();

      //-- check for internet Connection
      networkManager.checkInternetConnection;

      //-- validate user form fields
      if (!personalAccountRegisterKey.currentState!.validate()) {
        ShowDialog.cancelDialog();
        return;
      }

      //-- Register users
      final userCredentials = await PersonalAccountFirebaseAuthController()
          .personalAccountCreateUser(
              email: emailController.text, password: passwordController.text);

      //-- store users data to firestore db
      final newUsers = PersonalAccountUsersModel(
          id: userCredentials.user!.uid,
          fullname: fullnameController.text,
          email: emailController.text,
          phonenumber: phonenumberController.text,
          profileImage: "");
      firestoreController.personalAccountCreateUsersAccount(newUsers);

      //-- Stop Loading dialog
      ShowDialog.cancelDialog();

      //-- keep users logged in
      personalAccountRegisterDataPersistent.write(
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
}
