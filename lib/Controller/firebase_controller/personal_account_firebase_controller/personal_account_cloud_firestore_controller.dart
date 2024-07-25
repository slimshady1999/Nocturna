import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/firebase_exceptions/firebase_exceptions.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';
import 'package:nocturna/Model/personal_account_users_model.dart';

class PersonalAccountFirebaseFirestoreController extends GetxController {
  //-- Variables
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final firebaseAuthController =
      Get.put(PersonalAccountFirebaseAuthController());

  //-- Method to create users data
  Future<void> personalAccountCreateUsersAccount(
      PersonalAccountUsersModel users) async {
    try {
      await db
          .collection("PersonalUserAccount")
          .doc(users.id)
          .set(users.toJson());
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //-- Method to Fetch Users data
  Future<PersonalAccountUsersModel> personalAccountfetchUsersAccount() async {
    try {
      final documentSnapshot = await db
          .collection("PersonalUserAccount")
          .doc(firebaseAuthController.user?.uid)
          .get();
      if (documentSnapshot.exists) {
        return PersonalAccountUsersModel.fromSnapshot(documentSnapshot);
      } else {
        return PersonalAccountUsersModel.emptyUserModel();
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //-- Method to update Users data
  Future<void> personalAccountupdateUsersAccount(
      PersonalAccountUsersModel updateUsers) async {
    try {
      await db
          .collection("PersonalUserAccount")
          .doc(updateUsers.id)
          .update(updateUsers.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //-- Method to update single Users data
  Future<void> personalAccountUpdateSingleUsersDetail(
      Map<String, dynamic> json) async {
    try {
      await db
          .collection("PersonalUserAccount")
          .doc(firebaseAuthController.user?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
