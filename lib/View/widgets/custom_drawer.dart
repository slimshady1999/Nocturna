import 'package:flutter/material.dart';
import '../../profile.dart';
import '../../bills/bills.dart';
import '../../bills/bill_splitter.dart';
import '../../payment/payment.dart';
import '../../social_media/feeds.dart';
import '../../settings.dart';
import '../../social_media/add_friends_screen.dart';

customDrawer(BuildContext context) {
  return Container(
      color: Colors.white,
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 1.3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 82, 3, 96),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5, right: 15),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/splash.jpg"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("John Doe",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                      Text("johndoe@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Messages'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FriendsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Add friends'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddFriendsScreen()));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.business_center),
            //   title: const Text('Business Owner'),
            //   onTap: () {
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => BusinessOwnerPage()));
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Split Bill'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BillSplitterScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Bill History'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BillsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
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
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to SettingsScreen when the "Settings" item is tapped
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
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
      ));
}
