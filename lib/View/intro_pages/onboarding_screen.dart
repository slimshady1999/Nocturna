import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/intro_screen_controller/onboarding_page_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingPageController());
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
                      effect:
                          const WormEffect(activeDotColor: Colors.deepPurple),
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
            child: Image.asset(
              "assets/club1.jpg",
              fit: BoxFit.cover,
            )),

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
            child: Image.asset(
              "assets/night2.jpg",
              fit: BoxFit.cover,
            )),

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
            child: Image.asset(
              "assets/event1.jpg",
              fit: BoxFit.cover,
            )),

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
