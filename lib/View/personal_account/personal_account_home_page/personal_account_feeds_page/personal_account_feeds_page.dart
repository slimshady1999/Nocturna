import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/screen_refresh_controller/screen_refresh_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/fetch_users_data.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_feeds_page/personal_account_post_page.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_user_dashboard_page/personal_account_dashboard_page.dart';
import 'package:nocturna/View/personal_account/personal_account_shopping_page/personal_account_shopping_page.dart';
import 'package:nocturna/View/widgets/custom_drawer.dart';

class PersonalAccountFeedsPage extends StatefulWidget {
  const PersonalAccountFeedsPage({super.key});

  @override
  State<PersonalAccountFeedsPage> createState() =>
      _PersonalAccountFeedsPageState();
}

class _PersonalAccountFeedsPageState extends State<PersonalAccountFeedsPage> {
  final usersData = Get.put(FetchUsersData());
  final refreshController = Get.put(ScreenRefreshController());
  final Query<Map<String, dynamic>> fetchPost = FirebaseFirestore.instance
      .collection("FeedPosts")
      .orderBy("postDate", descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.asset(
          "assets/new_logo.png",
          height: 105,
          width: 105,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const PersonalAccountShoppingPage());
              },
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Theme.of(context).colorScheme.secondary,
                size: 25,
              )),
          GestureDetector(
            onTap: () {
              Get.to(() => const PersonalAccountDashboard());
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 40,
              width: MediaQuery.of(context).size.width / 4.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: Text("Dashboard",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => refreshController.refreshData(),
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.refresh, color: Colors.white)),
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- Profile image
            Obx(() {
              final networkProfileImage = usersData.user.value.profileImage;
              if (usersData.isLoading.value) {
                return const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(color: Colors.deepPurple));
              }

              return Container(
                margin: const EdgeInsets.only(top: 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: networkProfileImage.isNotEmpty
                          ? CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                networkProfileImage,
                              ))
                          : const CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                "assets/dp.png",
                              )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PersonalAccountPostPage());
                      },
                      child: Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(108, 214, 214, 214),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("What's on your mind?",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const PersonalAccountPostPage());
                        },
                        child: Icon(
                          Icons.photo,
                          size: 38.5,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),

            //-- Feeds Post
            Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                height: MediaQuery.of(context).size.height / 1.2,
                width: double.infinity,
                child: StreamBuilder(
                    stream: fetchPost.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.deepPurple),
                        );
                      }
                      if (streamSnapshot.connectionState ==
                          ConnectionState.none) {
                        return const Center(child: Text("No post found"));
                      }
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 90),
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];

                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 12),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(20, 104, 58, 183),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //-- profile Image and name of author
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 15),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipOval(
                                              // radius: 28,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: documentSnapshot[
                                                    "postAuthorPicture"],
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color: Colors
                                                                    .deepPurple)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(documentSnapshot["postAuthor"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                            //-- created date
                                            Text(
                                                "posted: ${documentSnapshot["postDate"]}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            //-- feeling
                                            Text(
                                                "Location: ${documentSnapshot["addLocation"]}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall)
                                          ],
                                        ),
                                      ]),
                                    ),

                                    //-- Post Description
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 13,
                                          bottom: 5,
                                          right: 6),
                                      child: Text(
                                          documentSnapshot["postDescription"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ),

                                    //--  Post Image
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 7, left: 7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.9,
                                      width: double.infinity,
                                      child: Stack(children: [
                                        //-- Post Image
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.9,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                documentSnapshot["postImage"],
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: Colors
                                                                .deepPurple)),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child:
                                                      //-- feeling
                                                      Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        "Am feeling: ${documentSnapshot["addFeeling"]}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ]),
                                    ),

                                    //-- Like buttons
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 20),
                                      child: Row(children: [
                                        //-- Like button
                                        CircleAvatar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            child: const Icon(
                                                Icons.thumb_up_off_alt_sharp,
                                                color: Colors.white)),

                                        //-- Spacing
                                        const SizedBox(width: 15),

                                        //-- Share button
                                        const CircleAvatar(
                                            backgroundColor: Color.fromARGB(
                                                47, 158, 158, 158),
                                            child: Icon(Icons.share,
                                                color: Colors.black)),
                                      ]),
                                    )
                                  ]),
                            );
                          },
                        );
                      }
                      return const CircularProgressIndicator(color: Colors.red);
                    }))
          ],
        ),
      ),
    );
  }
}



 //-- Night club events
                          // const SizedBox(height: 35),
                          // CarouselSlider(
                          //     items: [
                          //       CustomEventCarouselCards.eventCarouselCard1(
                          //           context),
                          //       CustomEventCarouselCards.eventCarouselCard2(context)
                          //     ],
                          //     options: CarouselOptions(
                          //       height: 140,
                          //       enlargeCenterPage: true,
                          //       autoPlay: true,
                          //       autoPlayAnimationDuration:
                          //           const Duration(milliseconds: 800),
                          //       autoPlayInterval: const Duration(seconds: 5),
                          //     )),