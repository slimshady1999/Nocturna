import 'package:flutter/material.dart';

class PersonalAccountProfilePage extends StatelessWidget {
  const PersonalAccountProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-- Profile Heading
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/splash.jpg"),
                  ),
                ),
                Container(
                  height: 150,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          bottomLeft: Radius.circular(65))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("John Doe",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white)),
                            const SizedBox(
                              width: 4.6,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("johndoe@gmail.com",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("08134567875",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ]),

              //-- Profile contents
              const SizedBox(
                height: 20,
              ),

              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('Messages'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => FriendsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Add friends'),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddFriendsScreen()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Split Bill'),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => BillSplitterScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Bill History'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => BillsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payment'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
              ),

              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Navigate to SettingsScreen when the "Settings" item is tapped
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () {
                  // Implement sign out logic here
                },
              ),
              // Other drawer items remain the same
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
