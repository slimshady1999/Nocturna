import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/intro_pages/onboarding_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => const OnboardingPage());
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
