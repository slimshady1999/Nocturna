import 'package:dio/dio.dart';
import 'package:nocturna/View/widgets/api_test/model.dart';

class ApiServices {
  //-- variables
  final String apikey = "6bb1adc209914dfda6f4a534dbe29f0a";
  final Dio _dio = Dio();

  Future<List<NewsModel>> fetchApiData() async {
    try {
      final url =
          ("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apikey");

      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> newsJsonList = response.data["articles"];
        return newsJsonList.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw " failed to load data";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
