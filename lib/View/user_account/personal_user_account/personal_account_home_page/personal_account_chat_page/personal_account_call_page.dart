import 'package:flutter/material.dart';

class PersonalAccountCallPage extends StatelessWidget {
  const PersonalAccountCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 96),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Calls",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 17),
              child: Text(
                "Recent",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              color: Colors.black,
              height: 1.2,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 9),
            ),

            //-- Calls
            const SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("H",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("Harmony Mark",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    "12, April 2024",
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(112, 204, 204, 204),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.phone, color: Colors.green)),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("J",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("John Doe",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    "23, August 2024",
                    style: Theme.of(context).textTheme.bodySmall),
                trailing: CircleAvatar(
                  backgroundColor: const Color.fromARGB(112, 204, 204, 204),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.phone, color: Colors.green)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
