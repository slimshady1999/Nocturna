import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/firebase_storage/personal_account_firebase_storage/personal_account_profile_picture_upload.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';

class PersonalAccountEditProfilePage extends StatelessWidget {
  const PersonalAccountEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usersData = Get.put(FetchUsersData());
    final uplaodProfilePictureController =
        Get.put(PersonalAccountProfilePictureUploadController());
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Account", style: Theme.of(context).textTheme.titleLarge),
        ),
        body: SingleChildScrollView(child: Obx(() {
          final networkProfileImage = usersData.user.value.profileImage;
          if (usersData.isLoading.value &&
              uplaodProfilePictureController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple));
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-- profile header
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: double.infinity,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          networkProfileImage.isNotEmpty
                              ? CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    networkProfileImage,
                                  ))
                              : const CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.yellow,
                                  backgroundImage: AssetImage(
                                    "assets/dp.png",
                                  )),

                          //-- Edit profile button
                          IconButton(
                              onPressed: () {
                                uplaodProfilePictureController
                                    .uploadUserProfileImage();
                              },
                              icon: const Icon(Icons.edit, size: 30))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 6.0),
                                child: Icon(Icons.person,
                                    color: Colors.black, size: 18),
                              ),
                              Text(usersData.user.value.fullname.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
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
                                    color: Colors.black, size: 18),
                              ),
                              Text(usersData.user.value.email,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                const Divider(),

                //-- Profile Information
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: Text("Profile Information",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                ListTile(
                    leading: Text('Name',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.fullname,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))),
                ListTile(
                    leading: Text('Email',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.email,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))),
                const Divider(),

                //-- Personal Information
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: Text("Personal Information",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 6),
                ListTile(
                    leading: Text('User Id',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.id,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.copy))),
                ListTile(
                    leading: Text('Email',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.email,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))),
                ListTile(
                    leading: Text('Phone Number',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.phonenumber,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))),
                ListTile(
                    leading: Text('Email',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey)),
                    title: Text(usersData.user.value.email,
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))),

                //-- Spacing
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Close Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.red)),
                    ),
                  ],
                )
              ]);
        })));
  }
}
