import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../firebase_exceptions/firebase_exceptions.dart';

//-- Firebase Auths
class PersonalAccountFirebaseAuthController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  //-- Create Users
  Future<UserCredential> personalAccountCreateUser(
      {required String email, required String password}) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "somethng went wrong";
    }
  }

  //-- login Users
  Future<UserCredential> personalAccountLoginUser(
      String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "somethng went wrong";
    }
  }

  // -- User Logout
  Future<void> personalAccountLogout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "somethng went wrong";
    }
  }

  //-- Password Reset
  Future<void> personalAccountForgetPasssword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } catch (e) {
      throw "ops something went wrong";
    }
  }
}
