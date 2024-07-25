import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/intro_screen_controller/onboarding_page_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  final controller = Get.put(OnboardingPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.onLastPage.value = (index == 2);
          },
          children: [pageOne(context), pageTwo(context), pageThree(context)],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.skipPage();
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  SmoothPageIndicator(
                      effect: const WormEffect(
                          dotHeight: 5, activeDotColor: Colors.deepPurple),
                      controller: controller.pageController,
                      count: 3),
                  controller.onLastPage.value
                      ? SizedBox(
                          height: 40,
                          width: 100,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple,
                            child: InkWell(
                              onTap: () {
                                controller.startPage();
                              },
                              child: Center(
                                child: Text(
                                  "Start",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 40,
                          width: 100,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                controller.nextPage();
                              },
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

//-- Page 1
pageOne(BuildContext context) {
  return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          width: double.infinity,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/nocturna1.appspot.com/o/Onboarding_images%2Fclub1.jpg?alt=media&token=13ec4a5b-9cc0-4f00-a4a5-e6c28cdcab8c",
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        //-- Text
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            "Nocturna is an innovative Entertainment Brokerage Hub Providing the ultimate bridge between nightlife spots (Place Owners,"
            "Places,"
            "Spots) and their customers.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    ),
  );
}

//-- Page 2
pageTwo(BuildContext context) {
  return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          width: double.infinity,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/nocturna1.appspot.com/o/Onboarding_images%2Fnight2.jpg?alt=media&token=3e5cea13-b5d1-4435-a990-8fc432560ad3",
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        //-- Text
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            "We provide customers with a digital platform where they can sign-up and connect with other users, share fun hangout experiences Easily find great hangouts spots, receive discounts for products and services offered by Place Owners.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    ),
  );
}

//-- Page 3
pageThree(BuildContext context) {
  return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          width: double.infinity,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/nocturna1.appspot.com/o/Onboarding_images%2Fevent1.jpg?alt=media&token=fcda0a16-57dd-4887-8469-d385004b23ce",
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        //-- Text
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            "On the other hand, we provide the platform that allows place owners and advertisers sign-up and gain access to reach & sell,  book rides to desired places, pay for products & services as well as share bills with friends remotely.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    ),
  );
}
