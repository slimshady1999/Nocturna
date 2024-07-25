import 'package:flutter/material.dart';
import 'package:nocturna/View/user_authentications/business_account_auth_dialog/business_account_auth_page.dart';
import 'package:nocturna/View/user_authentications/personal_account_auth_dialog/person_account_auth_page.dart';
import 'package:nocturna/View/user_authentications/social_account_register_dialogs/social_Registration_dialog.dart';

class UserRole extends StatelessWidget {
  const UserRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(backgroundColor: Colors.white),
        body: SingleChildScrollView(
          child: Column(children: [
            //-- App Logo
            const SizedBox(height: 100),
            Image.asset("assets/logo_new.png", height: 70, width: 200),

            // Join us text
            const SizedBox(height: 30),
            Text("JOIN US VIA", style: Theme.of(context).textTheme.bodyMedium),

            //-- Login with email/password
            GestureDetector(
              onTap: () {
                PersonAccountLoginDialog.personalAccountLogingDialog();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(61, 158, 158, 158),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10.0),
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: const Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("Email/Password",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ])),
            ),

            //-- Login with phone number
            GestureDetector(
              onTap: () {
                SocialRegisterationDialog.phonenumberDialog();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(58, 158, 158, 158),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10.0),
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: const Icon(Icons.phone, color: Colors.white),
                      ),
                    ),
                    Text("Phone Number",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ])),
            ),

            //-- Login using facebook
            GestureDetector(
              onTap: () {
                SocialRegisterationDialog.facebookDialog();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(61, 158, 158, 158),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10.0),
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: const Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("Facebook",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ])),
            ),

            //-- Buisness account
            const SizedBox(height: 50),
            Text("In For Business? create a business profile.",
                style: Theme.of(context).textTheme.bodyMedium),
            GestureDetector(
              onTap: () {
                BusinessAccountRegisterationDialog.comingSoonDialog();
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 15, left: 50, right: 50),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text("BUSINESS ACCOUNT",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white)))),
            ),
          ]),
        ));
  }
}
