import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //-- variables
  final fullnameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey();
}
