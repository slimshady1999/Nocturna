import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/feed_posts_controller/pick_image_from_device.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_feeds_post_cloud_firestore.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';
import 'package:nocturna/Model/feeds_posts.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadPostController extends GetxController {
  //-- controllers
  final controller = Get.put(PersonalAccountFeedsPostCloudFirestore());
  final networkController = Get.put(NetworkManager());
  final uploadImageController = Get.put(PersonalAccountFeedPostImages());
  final userData = Get.put(FetchUsersData());
//  final feedsPostData = Get.put(FetchFeedsPostController());

  //-- variables
  final postDescription = TextEditingController();
  final postImage = "".obs;
  final addLocation = TextEditingController();
  final addFeeling = TextEditingController();
  final postDate = DateTime.now();
  final FirebaseStorage cloudStorage = FirebaseStorage.instance;

  //-- function for uploading
  void uploadPost() async {
    try {
      //-- show loading dialog
      ShowDialog.waitingDialog();

      //-- check for internet connection
      await networkController.checkInternetConnection();

      //-- upload data to cloud firestore
      final pickedImages = uploadImageController.pickedImage;

      final ref = cloudStorage.ref().child("postImages ${pickedImages!.name}");
      await ref.putFile(File(pickedImages.path));
      final imageUrl = await ref.getDownloadURL();
      imageUrl;

      final uploadFeedsPost = FeedsPost(
          // id: feedsPostData.user.value.id,
          postAuthor: userData.user.value.fullname,
          postAuthorPicture: userData.user.value.profileImage,
          postDescription: postDescription.text,
          postImage: imageUrl,
          addLocation: addLocation.text,
          addFeeling: addFeeling.text,
          postDate: postDate.toLocal().toString());

      await controller.uploadPost(uploadFeedsPost);

      //-- stop Loading
      ShowDialog.cancelDialog();
    } catch (e) {
      throw e.toString();
    } finally {
      //-- stop Loading
      ShowDialog.cancelDialog();
    }
  }
}
