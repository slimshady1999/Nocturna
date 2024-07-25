import 'package:get/get.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/intro_screen_controller/onboarding_page_controller.dart';

void getxInit() async {
  Get.put(OnboardingPageController());
  Get.put<NetworkManager>(NetworkManager(), permanent: true);
}
