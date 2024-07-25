import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalAccountUsersModel {
  final String id;
  String fullname;
  String email;
  String phonenumber;
  String profileImage;

  //-- Contructor
  PersonalAccountUsersModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phonenumber,
    required this.profileImage,
  });

  //-- Create an empty PersonalAccountUserModel
  static PersonalAccountUsersModel emptyUserModel() =>
      PersonalAccountUsersModel(
          id: '', fullname: '', email: '', phonenumber: '', profileImage: '');

  //-- Convert the Model to Json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullname": fullname,
      "email": email,
      "phonenumber": phonenumber,
      "profileImage": profileImage,
    };
  }

  //-- Factory method to create a user model from a firebase document Snapshot
  factory PersonalAccountUsersModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return PersonalAccountUsersModel(
          id: document.id,
          fullname: data["fullname"] ?? "",
          email: data["email"] ?? "",
          phonenumber: data["phonenumber"] ?? "",
          profileImage: data["profileImage"] ?? "");
    } else {
      return PersonalAccountUsersModel.emptyUserModel();
    }
  }
}
