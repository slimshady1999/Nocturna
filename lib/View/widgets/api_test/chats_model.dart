class ChatsModel {
  String name;
  String messages;
  String profileLetter;

  ChatsModel(
      {required this.name,
      required this.messages,
      required this.profileLetter});
}

List<ChatsModel> chatsModel = [
  ChatsModel(
      name: "John Brown",
      messages:
          " Hello mate have you tried the new feature? heard its in beta state",
      profileLetter: "J.B"),
  ChatsModel(
      name: "Samuel Jackson",
      messages: " How many month have you spent of this app?",
      profileLetter: "S.J"),
  ChatsModel(
      name: "Esther Hope",
      messages: "I have transferred the cash to you, seen it?",
      profileLetter: "E.H"),
  ChatsModel(
      name: "Tony Isaac",
      messages: " How many month have you spent of this app? nahhh",
      profileLetter: "T.I"),
];
