import 'package:flutter/material.dart';

class PersonalAccountUserChats extends StatelessWidget {
  const PersonalAccountUserChats(
      {super.key, required this.name, required this.message});
  final String name, message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 96),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(name,
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
                          color: Color.fromARGB(255, 82, 3, 96),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          message,
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
            height: 70,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const TextField(
                    maxLines: null,
                    expands: true,
                    minLines: null,
                    decoration: InputDecoration(
                      hintText: "Say Something!",
                      fillColor: Color.fromARGB(33, 158, 158, 158),
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
                const SizedBox(
                  width: 15,
                ),
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
