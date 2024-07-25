import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_feeds_post_cloud_firestore.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';

class PersonalAccountFeedPostImages extends GetxController {
  //-- controllers
  final updateUserFieldController =
      Get.put(PersonalAccountFeedsPostCloudFirestore());
  final fetchUsersDataController = Get.put(FetchUsersData());

  //-- variables
  final cloudStorage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();
  final isLoading = false.obs;
  RxString postImage = "".obs;
  XFile? pickedImage;

//-- Pick Image profile picture
  Future<void> pickFeedPostImage() async {
    try {
      //-- pick the image from source either Gallery or Camera
      pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        postImage.value = pickedImage!.path;
        SnackBarController.successSnackBar(
            "Image Added", "Image added successfully");
      }
    } catch (e) {
      throw "no image picked";
    }
  }
}
