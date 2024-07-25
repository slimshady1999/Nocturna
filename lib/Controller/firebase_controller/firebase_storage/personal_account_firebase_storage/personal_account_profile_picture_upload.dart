import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_cloud_firestore_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';

class PersonalAccountProfilePictureUploadController extends GetxController {
  //-- controllers
  final updateUserFieldController =
      Get.put(PersonalAccountFirebaseFirestoreController());
  final fetchUsersDataController = Get.put(FetchUsersData());

  //-- variables
  final cloudStorage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();
  final isLoading = false.obs;

  //-- Upload profile picture to firebase storage
  Future<String> storeProfileImage(String path, XFile image) async {
    try {
      //- store image to cloub path
      final ref = cloudStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw e.toString();
    }
  }

  //-- Upload user profile picture
  uploadUserProfileImage() async {
    try {
      //-- pick the image from source either Gallery or Camera
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);

      //-- check if the image is selected from source
      if (image != null) {
        isLoading.value = true;
        final imageUrl =
            await storeProfileImage("Personal_Account_Profile_Image/", image);

        //-- update user profile picture field

        Map<String, dynamic> json = {"profileImage": imageUrl};
        await updateUserFieldController
            .personalAccountUpdateSingleUsersDetail(json);

        fetchUsersDataController.user.value.profileImage = imageUrl;
        SnackBarController.successSnackBar(
            "Success", "profile image uploaded successfully");
      }
    } catch (e) {
      isLoading.value = false;
      throw e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
