import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/personal_account_firebase_controller/personal_account_firebase_auth_controller.dart';
import 'package:nocturna/Controller/internet_connection_controller/internet_connection_controller.dart';
import 'package:nocturna/Controller/snackbar_controller/snackbar_controller.dart';
import 'package:nocturna/View/intro_pages/onboarding_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/View/widgets/personal_account_bottom_navigation_bar.dart';

class SplashPageController extends GetxController {
  final networkController = Get.put(NetworkManager());

  //-- Variables
  GetStorage splashControllerStorage = GetStorage();
  final controller = Get.put(PersonalAccountFirebaseAuthController());

  @override
  void onReady() {
    super.onReady();
    splashPageLoader();
  }

  Future<void> splashPageLoader() async {
    try {
      //-- check for internet access
      final isConnected = await networkController.checkInternetConnection();
      if (!isConnected) {
        networkController.hasConnection.value = false;
        return;
      }

      //-- check if user is logged in or not
      if (controller.user?.uid != null) {
        splashControllerStorage.read("alreadyLoggedIn");
        Get.offAll(() => const PersonalAccountCustomBottomNavigationBar());
      } else {
        //-- Navigate to onboarding Screen
        Get.to(() => OnboardingPage());
      }
    } catch (e) {
      SnackBarController.errorSnackBar(title: "Slow Internet", message: "slow");
    }
  }
}
