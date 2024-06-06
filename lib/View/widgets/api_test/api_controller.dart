import 'package:get/get.dart';
import 'package:nocturna/View/widgets/api_test/api_service.dart';
import 'package:nocturna/View/widgets/api_test/model.dart';

class NewsController extends GetxController {
  // variables
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  void fetchData() async {
    try {
      final List<NewsModel> news = await ApiServices().fetchApiData();
      newsList.assignAll(news);
    } catch (e) {
      throw e.toString();
    } finally {
      isLoading(false);
    }
  }
}
