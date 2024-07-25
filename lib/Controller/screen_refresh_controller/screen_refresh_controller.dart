import 'package:get/get.dart';

class ScreenRefreshController extends GetxController {
  //-- refresh data
  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.forceAppUpdate();
    });
  }
}
