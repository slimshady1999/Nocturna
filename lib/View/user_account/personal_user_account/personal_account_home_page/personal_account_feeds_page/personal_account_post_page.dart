import 'package:flutter/material.dart';

class PersonalAccountPostPage extends StatelessWidget {
  const PersonalAccountPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        title: Text("Create Post",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("POST",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Poster name
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 27,
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
            Container(
                margin: const EdgeInsets.only(top: 10),
                height: 300,
                width: double.infinity,
                color: const Color.fromARGB(76, 136, 136, 136),
                child: TextField(
                  maxLines: 40,
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

            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 90,
              width: 70,
              color: const Color.fromARGB(66, 158, 158, 158),
              child: const Icon(
                Icons.add,
              ),
            ),

            //-- list of options
            const SizedBox(
              height: 10,
            ),

            ListTile(
              onTap: () {},
              leading: const Icon(Icons.photo),
              title: Text("Add Photo",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.location_history),
              title: Text("Add Location",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            ListTile(
              onTap: () {},
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
                    //   Get.offAll(() => const CustomBottomNavigationBar());
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
