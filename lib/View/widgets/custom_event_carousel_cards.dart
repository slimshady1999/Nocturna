import 'package:flutter/material.dart';

//-- Events Carousel card
class CustomEventCarouselCards {
  //-- card 1
  static eventCarouselCard1(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(131, 0, 0, 0), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage("assets/event1.jpg"))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Free Drinks Events",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
            Text("Starting from 12th, oct 2024",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white)),
            const SizedBox(height: 20),
            Container(
              height: 40,
              width: 80,
              margin: const EdgeInsets.only(left: 5),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 82, 3, 96),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text("View",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //-- card 2
  static eventCarouselCard2(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(131, 0, 0, 0), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage("assets/bar1.jpg"))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Drinking Games",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
            Text("Starting from 12th, oct 2024",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white)),
            const SizedBox(height: 20),
            Container(
              height: 40,
              width: 80,
              margin: const EdgeInsets.only(left: 5),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 82, 3, 96),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text("View",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
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
