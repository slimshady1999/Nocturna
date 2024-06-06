import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/intro_pages/user_role_screen.dart';

class OnboardingPageController extends GetxController {
  //-- Variables
  Rx onLastPage = false.obs;
  PageController pageController = PageController(
    initialPage: 0,
  );

  //-- Next Page
  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
  }

  void startPage() {
    Get.offAll(() => const UserRole());
  }

  void skipPage() {
    Get.offAll(() => const UserRole());
  }
}
