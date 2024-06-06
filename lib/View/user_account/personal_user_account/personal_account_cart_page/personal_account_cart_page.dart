import 'package:flutter/material.dart';

class PersonalAccountCartPage extends StatelessWidget {
  const PersonalAccountCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 96),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Cart",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Image.asset("assets/hotwine.jpg"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Red Wine",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "N\ 17900",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 82, 3, 96),
                                      radius: 15,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.add,
                                              size: 15, color: Colors.white))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 82, 3, 96),
                                      radius: 15,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: Colors.white,
                                          ))),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete, color: Colors.red)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),

          //-- Check out button
          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Material(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 82, 3, 96),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: Center(
                  child: Text(
                    "Check out",
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
    );
  }
}
