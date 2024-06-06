import 'package:flutter/material.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_cart_page/personal_account_cart_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_chat_page/personal_account_call_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_chat_page/personal_account_chat_page.dart';

class BottomChatBar extends StatefulWidget {
  const BottomChatBar({super.key});

  @override
  State<BottomChatBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<BottomChatBar> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final pages = [
    const PersonalAccountChatPage(),
    const PersonalAccountCallPage(),
    const PersonalAccountCartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            selectedItemColor: const Color.fromARGB(255, 82, 3, 96),
            onTap: onTap,
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: "Chats"),
              BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Calls"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
        body: pages[currentIndex]);
  }
}
