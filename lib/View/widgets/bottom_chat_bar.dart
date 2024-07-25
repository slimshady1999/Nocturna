import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nocturna/View/personal_account/personal_account_cart_page/personal_account_cart_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_call_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_chat_page.dart';

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
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              color: Colors.white,
              tabBackgroundColor: Colors.white,
              activeColor: Theme.of(context).colorScheme.secondary,
              selectedIndex: currentIndex,
              onTabChange: onTap,
              padding: const EdgeInsets.all(10),
              gap: 8,
              tabs: [
                GButton(
                  text: "Chats",
                  icon: Icons.chat,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "Calls",
                  icon: (Icons.dashboard),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "Settings",
                  icon: (Icons.settings),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        body: pages[currentIndex]);
  }
}
