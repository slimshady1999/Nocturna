import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/intro_screen_controller/splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashPageController());
    Future.delayed(const Duration(seconds: 10), () {
      controller.splashPageLoader();
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/new_logo.png',
              width: 300,
            ),
          )
        ],
      ),
    );
  }
}
