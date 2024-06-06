import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_feeds_page/personal_account_post_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_user_dashboard_page/personal_account_dashboard_page.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_shopping_page/personal_account_shopping_page.dart';
import 'package:nocturna/View/widgets/custom_drawer.dart';
import 'package:nocturna/View/widgets/custom_event_carousel_cards.dart';

class PersonalAccountFeedsPage extends StatelessWidget {
  const PersonalAccountFeedsPage({super.key});

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
      drawer: customDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- Create post section
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/splash.jpg"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PersonalAccountPostPage());
                  },
                  child: Container(
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(212, 255, 255, 255),
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
                      size: 40,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),

            //-- Night club events
            const SizedBox(height: 35),
            CarouselSlider(
                items: [
                  CustomEventCarouselCards.eventCarouselCard1(context),
                  CustomEventCarouselCards.eventCarouselCard2(context)
                ],
                options: CarouselOptions(
                  height: 140,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 5),
                )),

            //-- Posts
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //-- Poster name
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage('assets/splash.jpg'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "nocturna updates...",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),

                    //-- Text
                    const SizedBox(height: 10),
                    Text(
                      maxLines: 4,
                      "Drinking contest coming live on october 2024, other info will be announced later...",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    //-- Image
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/event1.jpg",
                              ))),
                    ),
                    //-- like & share buttons
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 210, 209, 209),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.thumb_up,
                                    size: 18,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                              Text(
                                "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 210, 209, 209),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chat,
                                    size: 18,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                              Text(
                                "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 210, 209, 209),
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share_rounded,
                                size: 18,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            //-- Post 2
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //-- Poster name
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 22,
                              backgroundImage: AssetImage('assets/splash.jpg'),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "nocturna updates...",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),

                      //-- Text
                      const SizedBox(height: 10),
                      Text(
                        maxLines: 4,
                        "Drinking contest coming live on october 2024, other info will be announced later...",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                      //-- Image
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/night2.jpg",
                                ))),
                      ),
                      //-- like & share buttons
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 210, 209, 209),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 18,
                                    )),
                                Text(
                                  "0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 210, 209, 209),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chat,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 18,
                                    )),
                                Text(
                                  "0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(103, 210, 209, 209),
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 18,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
