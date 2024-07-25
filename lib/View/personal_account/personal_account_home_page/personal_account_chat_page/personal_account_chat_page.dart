import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nocturna/Controller/chat_controller/available_users_%20controller.dart';
import 'package:nocturna/Controller/show_dialog_controller/show_dialog_controller.dart';
import 'package:nocturna/View/personal_account/personal_account_home_page/personal_account_chat_page/personal_account_user-chats.dart';
import 'package:nocturna/View/widgets/api_test/chats_model.dart';

class PersonalAccountChatPage extends StatelessWidget {
  const PersonalAccountChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllUsersController = Get.put(AvailableUserscontroller());
    //-- Check and display the chat onboarding screen if user haven't sent it before
    GetStorage chatOnboardingPersistence = GetStorage();
    Future.delayed(const Duration(milliseconds: 1), () {
      if (chatOnboardingPersistence.read("chatOnboardingPersistence")) {
        return;
      } else {
        ShowDialog.chatOnboardingDialog();
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Messages",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- List of users
            Container(
                height: MediaQuery.of(context).size.height / 4.5,
                width: double.infinity,
                color: Colors.red,
                child: StreamBuilder(
                    stream: getAllUsersController.fetchAllUsers(),
                    builder: (context, streamSnapshot) {
                      if (streamSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                                color: Colors.deepPurple));
                      } else if (streamSnapshot.connectionState ==
                          ConnectionState.none) {
                        return const Center(child: Text("No users found"));
                      }

                      if (streamSnapshot.hasData &&
                          streamSnapshot.data != null) {
                        print(streamSnapshot);
                        return ListView();
                      }

                      return Text("ahh");
                    })),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              width: double.infinity,
              child: ListView.builder(
                itemCount: chatsModel.length,
                itemBuilder: (context, index) {
                  ChatsModel chat = chatsModel[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => PersonalAccountUserChats(
                              chat: chat,
                            ));
                      },
                      child: Card(
                        child: ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage("assets/dp.png"),
                              backgroundColor: Color.fromARGB(32, 30, 75, 235),
                            ),
                            title: Text(chat.name,
                                style: Theme.of(context).textTheme.bodyMedium),
                            subtitle: Text(
                                overflow: TextOverflow.ellipsis,
                                chat.messages,
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//-- dates
dates() {
  return DateTime.now();
}
