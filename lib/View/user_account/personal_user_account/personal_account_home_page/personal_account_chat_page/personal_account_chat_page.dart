import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_home_page/personal_account_chat_page/personal_account_user-chats.dart';

class PersonalAccountChatPage extends StatelessWidget {
  const PersonalAccountChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Bassey John", "Grace Watson", " Emma joshua"];
    List<String> messages = [
      "Hello how are you doing",
      "It isn't full yet, job be patient"
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 96),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Chats",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //-- Chat users
            Card(
              child: ListTile(
                onTap: () {
                  Get.to(() => PersonalAccountUserChats(
                        name: titles.first,
                        message: messages.first,
                      ));
                },
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("B",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text(titles.first,
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    messages.first,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),

            Card(
              child: ListTile(
                onTap: () {
                  Get.to(() => PersonalAccountUserChats(
                        name: titles.last,
                        message: messages.last,
                      ));
                },
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("H",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text(titles.last,
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    messages.last,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 19.5,
                  backgroundColor: const Color.fromARGB(255, 82, 3, 96),
                  child: Text("A",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                ),
                title: Text("Adam W",
                    style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    "It isn't full yet, job be patient",
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

//-- dates

dates() {
  return DateTime.now();
}
