import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/firebase_exceptions/firebase_exceptions.dart';
import 'package:nocturna/Model/feeds_posts.dart';

class PersonalAccountFeedsPostCloudFirestore extends GetxController {
  //-- Variables
  final FirebaseFirestore cloudFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final feedsPost = <FeedsPost>[].obs;
  final isLoading = false.obs;

  //-- Create post
  Future<void> uploadPost(FeedsPost post) async {
    try {
      cloudFirestore.collection("FeedPosts").doc().set(post.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  // //-- fetch feeds post
  // Future<List<FeedsPost>> fetchFeedsPost() async {
  //   List<FeedsPost> feedsPost = [];
  //   try {
  //     isLoading.value = true;
  //     QuerySnapshot querySnapshot =
  //         await cloudFirestore.collection("FeedPosts").get();

  //     querySnapshot.docs.forEach((doc) {
  //       feedsPost.add(FeedsPost.fromJson({
  //         "postAuthor": doc["postAuthor"],
  //         "postAuthorPicture": doc["postAuthorPicture"],
  //         "postDescription": doc["postDescription"],
  //         "postImage": doc["postImage"],
  //         "addLocation": doc["addLocation"],
  //         "addFeeling": doc["addFeeling"],
  //         "postDate": doc["postDate"],
  //       }));
  //     });
  //   } on FirebaseException catch (e) {
  //     isLoading.value = false;
  //     throw CustomFirebaseAuthException(e.code).message;
  //   } catch (e) {
  //     isLoading.value = false;
  //   }
  //   return feedsPost;
  // }
}
