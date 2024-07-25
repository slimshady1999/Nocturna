import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/firebase_controller/feed_posts_controller/upload_post_controller.dart';
import 'package:nocturna/Controller/firebase_controller/feed_posts_controller/pick_image_from_device.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';

class PersonalAccountPostPage extends StatelessWidget {
  const PersonalAccountPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadPost = Get.put(UploadPostController());
    final addPhoto = Get.put(PersonalAccountFeedPostImages());
    final getUserData = Get.put(FetchUsersData());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        title: Text("Create Post",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        actions: [
          TextButton(
              onPressed: () {
                uploadPost.uploadPost();
              },
              child: Text("POST",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Poster name
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Obx(() {
                final profileImage = getUserData.user.value.profileImage;
                if (getUserData.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Row(
                  children: [
                    profileImage.isNotEmpty
                        ? CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              profileImage,
                            ))
                        : const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.yellow,
                            backgroundImage: AssetImage(
                              "assets/dp.png",
                            )),
                    const SizedBox(width: 10),
                    Text(
                      getUserData.user.value.fullname,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                );
              }),
            ),

            //-- Text
            Container(
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                height: 167,
                width: double.infinity,
                color: const Color.fromARGB(76, 136, 136, 136),
                child: TextField(
                  controller: uploadPost.postDescription,
                  maxLines: 10,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: "What's on your mind?",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                )),

            //-- show photo space
            const SizedBox(
              height: 10,
            ),

            ListTile(
              onTap: () {
                addPhoto.pickFeedPostImage();
              },
              leading: const Icon(Icons.photo),
              title: Text("Add Photo",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              onTap: () {
                addLocationPopup();
              },
              leading: const Icon(Icons.location_history),
              title: Text("Add Location",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              onTap: () {
                addFeelingsPopup();
              },
              leading: const Icon(Icons.emoji_emotions),
              title: Text("Add Feeling/Activity",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),

            //-- Post Button
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 20),
              height: 60,
              width: double.infinity,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,
                child: InkWell(
                  onTap: () {
                    uploadPost.uploadPost();
                  },
                  child: Center(
                    child: Text('POST',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//-- add Location pop up
addLocationPopup() {
  final controller = Get.put(UploadPostController());
  return showDialog(
      context: Get.context!,
      builder: (context) => Scaffold(
            backgroundColor: const Color.fromARGB(83, 158, 158, 158),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.location_on,
                        size: 40,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      //-- Text
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter your current location",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      //-- TextField
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 35, top: 12),
                        height: 45,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.addLocation,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(72, 158, 158, 158),
                              hintText: "pleasure park, port harcourt",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                      ),

                      Container(
                          margin: const EdgeInsets.only(
                              left: 100, right: 100, top: 15),
                          height: 50,
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).colorScheme.secondary,
                            child: InkWell(
                              onTap: () {
                                ShowDialog.cancelDialog();
                              },
                              borderRadius: BorderRadius.circular(25),
                              child: Center(
                                child: Text("Done",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                          ))
                    ]))
              ],
            ),
          ));
}

//-- add Feeling pop up
addFeelingsPopup() {
  final controller = Get.put(UploadPostController());
  return showDialog(
      context: Get.context!,
      builder: (context) => Scaffold(
            backgroundColor: const Color.fromARGB(83, 158, 158, 158),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Icon(
                        Icons.emoji_emotions,
                        size: 40,
                        color: Colors.orange,
                      ),
                      //-- Text
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "How are you feeling :)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      //-- TextField
                      Container(
                        margin:
                            const EdgeInsets.only(left: 35, right: 35, top: 12),
                        height: 45,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.addFeeling,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(72, 158, 158, 158),
                              hintText: "Excitied",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        ),
                      ),

                      Container(
                          margin: const EdgeInsets.only(
                              left: 100, right: 100, top: 15),
                          height: 50,
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).colorScheme.secondary,
                            child: InkWell(
                              onTap: () {
                                ShowDialog.cancelDialog();
                              },
                              borderRadius: BorderRadius.circular(25),
                              child: Center(
                                child: Text("Done",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                          ))
                    ]))
              ],
            ),
          ));
}
