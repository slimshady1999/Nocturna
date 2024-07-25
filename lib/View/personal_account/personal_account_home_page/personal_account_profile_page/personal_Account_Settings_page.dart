// ignore: file_names
import 'package:flutter/material.dart';

class PersonalAccountSettingsPage extends StatefulWidget {
  const PersonalAccountSettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<PersonalAccountSettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Settings',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text("App Settings",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            tileColor: Colors.white,
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Toggle dark mode here
                  // You can use packages like 'provider' or 'flutter_bloc' to manage the state.
                });
              },
            ),
          ),

          //-- Profile Settings
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text("Account Settings",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'Change Password',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'Delete Account',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.red),
            ),
          ),

          //-- App Terms
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text("App Guilds",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('Terms & Conditions',
                style: Theme.of(context).textTheme.bodyMedium),
          ),

          //-- Customer Support
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text("Customer Support",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              'support@nocturna',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('nocturna@gmail.com',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text('+234 8145648756',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
