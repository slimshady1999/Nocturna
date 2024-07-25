import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';

class AvailableUserscontroller extends GetxController {
  //-- controllers
  final currentuser = Get.put(PersonalAccountFirebaseAuthController());

  //-- Variables
  final collectionRef = FirebaseFirestore.instance;

  Stream fetchAllUsers() {
    try {
      collectionRef
          .collection("PersonalUserAccount")
          .where("uid", isNotEqualTo: currentuser.user!.uid)
          .snapshots();
    } catch (e) {
      throw e.toString();
    }
    return const Stream.empty();
  }
}
