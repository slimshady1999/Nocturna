import 'package:flutter/material.dart';
import 'package:nocturna/View/widgets/api_test/chats_model.dart';

class PersonalAccountUserChats extends StatelessWidget {
  final ChatsModel chat;

  const PersonalAccountUserChats({super.key, required this.chat});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(chat.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                // Get.to(() => const PersonalAccountShoppingPage());
              },
              icon: const Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
              )),
          GestureDetector(
            onTap: () {
              // Get.to(() => const PersonalAccountDashboard());
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8, left: 5),
              height: 40,
              width: MediaQuery.of(context).size.width / 3.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 4.3),
                      child: Icon(
                        Icons.video_chat_outlined,
                        color: Colors.deepPurple,
                        size: 20,
                      ),
                    ),
                    Text("Video Call",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.deepPurple)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      // height: 60,
                      width: 170,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          chat.messages,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Container(
                //       margin: const EdgeInsets.only(left: 5),
                //       height: 60,
                //       width: 170,
                //       decoration: const BoxDecoration(
                //           color: Color.fromARGB(255, 82, 3, 96),
                //           borderRadius: BorderRadius.only(
                //             topRight: Radius.circular(20),
                //             bottomLeft: Radius.circular(20),
                //             bottomRight: Radius.circular(20),
                //           )),
                //     ),
                //   ],
                // )
              ],
            ),
          )),

          //-- Text Input area
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
            height: 60,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    maxLines: 50,
                    expands: false,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      hintText: "Type here...",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      fillColor: const Color.fromARGB(21, 82, 9, 149),
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.link,
                      size: 30,
                      color: Color.fromARGB(255, 82, 3, 96),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 30,
                      color: Color.fromARGB(255, 82, 3, 96),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
