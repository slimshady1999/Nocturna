// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nocturnpro/View/widgets/api_test/api_controller.dart';

// // ignore: use_key_in_widget_constructors
// class NewsPage extends StatelessWidget {
//   final NewsController newsController = Get.put(NewsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('News'),
//       ),
//       body: Obx(() {
//         if (newsController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return ListView.builder(
//             itemCount: newsController.newsList.length,
//             itemBuilder: (context, index) {
//               var news = newsController.newsList[index];
//               return ListTile(
//                 title: Text(news.title.toString()),
//                 subtitle: Text(news.description.toString()),
//                 leading: news.urlToImage!.isNotEmpty
//                     ? Image.network(
//                         news.urlToImage.toString(),
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.cover,
//                       )
//                     : const SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Placeholder(),
//                       ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
