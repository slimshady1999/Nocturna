import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_chat_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_profile_page/personal_account_edit_profile_page.dart';
import 'package:nocturna/View/personal_account/personal_account_shopping_page/personal_account_shopping_page.dart';
import 'package:nocturna/View/personal_account/personal_account_split_bill/bill_dashboard.dart';
import 'package:nocturna/View/user_authentications/personal_account_auth_dialog/person_account_auth_page.dart';
import '../personal_account/personal_account_split_bill/bills.dart';
import '../../payment/payment.dart';
import '../personal_account/personal_account_home_page/personal_account_profile_page/personal_Account_Settings_page.dart';

customDrawer(BuildContext context) {
  return Container(
      color: Colors.white,
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 1.3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 15, top: 50),
              child: Image.asset("assets/logo_new.png", height: 60, width: 200),
            ),

            //-- sized box for spacing
            const SizedBox(height: 50),

            ListTile(
              leading: Icon(Icons.person,
                  color: Theme.of(context).colorScheme.secondary, size: 25),
              title:
                  Text('Profile', style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => const PersonalAccountEditProfilePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.chat,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title: Text('Messages',
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PersonalAccountChatPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title: Text('Shop', style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PersonalAccountShoppingPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.money,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title: Text('Split Bill',
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BillDashBoard()));
              },
            ),
            ListTile(
              leading: Icon(Icons.history,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title: Text('Bill History',
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BillsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.payment,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title:
                  Text('Payment', style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentScreen()));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.ad_units),
            //   title: const Text('Advertise'),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => AdvertiseScreen()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.upload_file),
            //   title: const Text('Upload Products'),
            //   onTap: () {
            //     // // Navigate to UploadProductsScreen when the "Upload Products" item is tapped
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => UploadProductsScreen()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.shopping_cart),
            //   title: const Text('Products'),
            //   onTap: () {
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => EcommerceScreen()));
            //   },
            // ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.secondary, size: 20),
              title: Text('Settings',
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                // Navigate to SettingsScreen when the "Settings" item is tapped
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PersonalAccountSettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red, size: 20),
              title:
                  Text('Log Out', style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                // Implement sign out logic here
                PersonAccountLoginDialog.personAccountLogoutDialog();
              },
            ),
            // Other drawer items remain the same
            // ...
          ],
        ),
      ));
}
