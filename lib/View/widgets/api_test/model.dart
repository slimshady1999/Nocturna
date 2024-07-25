class NewsModel {
  // 6bb1adc209914dfda6f4a534dbe29f0a
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "");
  }
}
