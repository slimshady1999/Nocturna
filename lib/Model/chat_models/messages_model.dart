class MessagesModel {
  String senderId;
  String receiverId;
  String timestamp;

  MessagesModel({
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "timestamp": timestamp
    };
  }

  factory MessagesModel.fromJson(Map<String, dynamic> data) {
    return MessagesModel(
        senderId: data['senderId'] ?? "",
        receiverId: data['receiverId'] ?? "",
        timestamp: data["timestamp"] ?? "");
  }
}
