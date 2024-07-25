import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';

class FeedsPost {
  //final String id;
  String postAuthor;
  String postAuthorPicture;
  String postDescription;
  String postImage;
  String addLocation;
  String addFeeling;
  String postDate;

  //-- Contructor
  FeedsPost({
    //required this.id,
    required this.postAuthor,
    required this.postAuthorPicture,
    required this.postDescription,
    required this.postImage,
    required this.addLocation,
    required this.addFeeling,
    required this.postDate,
  });

  //-- Create an empty PersonalAccountUserModel
  static FeedsPost emptyPostModel() => FeedsPost(
        // id: '',
        postAuthor: '',
        postAuthorPicture: '',
        postDescription: '',
        postImage: '',
        addLocation: '',
        addFeeling: '',
        postDate: '',
      );

  //-- Convert the Model to Json
  Map<String, dynamic> toJson() {
    return {
      // "id": id,
      "postAuthor": postAuthor,
      "postAuthorPicture": postAuthorPicture,
      "postDescription": postDescription,
      "postImage": postImage,
      "addLocation": addLocation,
      "addFeeling": addFeeling,
      "postDate": postDate,
    };
  }

  //-- Factory method to create a user model from a firebase document Snapshot

  factory FeedsPost.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return FeedsPost(
        // id: document.id,
        postAuthor: data["postAuthor"] ?? "",
        postAuthorPicture: data["postAuthorPicture"] ?? "",
        postDescription: data["postDescription"] ?? "",
        postImage: data["postImage"] ?? "",
        addLocation: data["addLocation"] ?? "",
        addFeeling: data["addFeeling"] ?? "",
        postDate: data["postDate"] ?? "",
      );
    } else {
      return FeedsPost.emptyPostModel();
    }
  }
}

final controller = Get.put(PersonalAccountFirebaseAuthController());
