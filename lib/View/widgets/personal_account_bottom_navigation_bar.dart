import 'package:flutter/material.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_feeds_page/personal_account_feeds_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_profile_page/personal_account_profile_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../user_account/personal_user_account/personal_account_home_page/personal_account_map_page/personal_account_map.dart';
import '../user_account/personal_user_account/personal_account_home_page/personal_account_user_dashboard_page/personal_account_dashboard_page.dart';

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
                  text: "Map",
                  icon: (Icons.map),
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



/*

BottomNavigationBar(
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
                    Icons.home,
                  ),
                  label: "Feeds"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet), label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_pin), label: "Map"),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),

*/