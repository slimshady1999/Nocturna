import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_cloud_firestore_controller.dart';
import 'package:nocturna/Model/personal_account_users_model.dart';

class FetchUsersData extends GetxController {
  //-- variables
  final firestoredb = Get.put(PersonalAccountFirebaseFirestoreController());
  Rx<PersonalAccountUsersModel> user =
      PersonalAccountUsersModel.emptyUserModel().obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetchUsersData();
  }

  //-- Method to fetch users data
  Future<void> fetchUsersData() async {
    try {
      isLoading.value = true;
      final user = await firestoredb.personalAccountfetchUsersAccount();
      this.user(user);
    } catch (e) {
      user(PersonalAccountUsersModel.emptyUserModel());
    } finally {
      isLoading.value = false;
    }
  }

  //-- Dispose
  @override
  void onClose() {
    super.onClose();
    fetchUsersData();
  }
}
