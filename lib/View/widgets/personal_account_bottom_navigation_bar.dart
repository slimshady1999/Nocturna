import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_chat_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_feeds_page/personal_account_feeds_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_profile_page/personal_account_profile_page.dart';
import '../personal_account/personal_account_home_page/personal_account_map_page/personal_account_map.dart';
import '../personal_account/personal_account_home_page/personal_account_user_dashboard_page/personal_account_dashboard_page.dart';

class PersonalAccountCustomBottomNavigationBar extends StatefulWidget {
  const PersonalAccountCustomBottomNavigationBar({super.key});

  @override
  State<PersonalAccountCustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<PersonalAccountCustomBottomNavigationBar> {
  int currentIndex = 0;
  void onTapChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final pages = [
    const PersonalAccountFeedsPage(),
    const PersonalAccountDashboard(
        // fullName: '',
        // email: '',
        // userId: '',
        ),
    const PersonalAccountChatPage(),
    const PersonalAccountMapPage(),
    const PersonalAccountProfilePage(),
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
              onTabChange: onTapChange,
              padding: const EdgeInsets.all(10),
              gap: 8,
              tabs: [
                GButton(
                  text: "Feeds",
                  icon: Icons.home_max,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "Dashboard",
                  icon: (Icons.dashboard),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "Chat",
                  icon: (Icons.chat),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "Map",
                  icon: (Icons.location_on),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                GButton(
                  text: "profile",
                  icon: (Icons.person),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        body: pages[currentIndex]);
  }
}
