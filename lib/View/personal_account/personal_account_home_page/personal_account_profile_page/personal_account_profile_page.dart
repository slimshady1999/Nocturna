import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/firebase_storage/personal_account_firebase_storage/personal_account_profile_picture_upload.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_chat_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_profile_page/personal_Account_Settings_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_profile_page/personal_account_edit_profile_page.dart';

class PersonalAccountProfilePage extends GetView<FetchUsersData> {
  const PersonalAccountProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersData = Get.put(FetchUsersData());
    final profilePictureLoading =
        Get.put(PersonalAccountProfilePictureUploadController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("Profile",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Obx(() {
              final networkProfileImage = usersData.user.value.profileImage;
              if (usersData.isLoading.value &&
                  profilePictureLoading.isLoading.value) {
                return const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(color: Colors.deepPurple));
              }
              return Container(
                height: MediaQuery.of(context).size.height / 9.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: networkProfileImage.isNotEmpty
                        ? CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              networkProfileImage,
                            ))
                        : const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              "assets/dp.png",
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: Icon(Icons.person,
                                  color: Colors.white, size: 18),
                            ),
                            Text(usersData.user.value.fullname.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child: Icon(Icons.email,
                                  color: Colors.white, size: 18),
                            ),
                            Text(usersData.user.value.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            }),

            //-- Profile Settings
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-- Profile contents
                    const SizedBox(
                      height: 35,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Profile Settings",
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    ListTile(
                      leading: Icon(Icons.person,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Profile',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        Get.to(() => const PersonalAccountEditProfilePage());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chat,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Messages',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        Get.to(() => const PersonalAccountChatPage());
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.shopping_bag,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Shop',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const PersonalAccountChatPage()));
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.money,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Split Bill',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BillSplitterScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.money,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Bill History',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => BillsScreen()));
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.payment,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Payment',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const PaymentScreen()));
                      },
                    ),

                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25),
                      title: Text('Settings',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        Get.to(() => const PersonalAccountSettingsPage());
                      },
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.logout, color: Colors.red, size: 25),
                      title: Text('Log out',
                          style: Theme.of(context).textTheme.bodyLarge),
                      onTap: () {
                        // Implement sign out logic here
                      },
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
