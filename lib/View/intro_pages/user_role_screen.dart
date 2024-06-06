import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/user_authentications/personal_account_auth/personal_login_page.dart';
import 'package:nocturna/View/widgets/personal_account_bottom_navigation_bar.dart';

class UserRole extends StatelessWidget {
  const UserRole({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: TabBar(
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              physics: const BouncingScrollPhysics(),
              indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20)),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Personal Account",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Business Account",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                )
              ]),
        ),
        body: TabBarView(
          children: [
            //-- Tan bar 1
            normalAccountTab(context),
            //--  Tab2
            businessAccountTab(context)
          ],
        ),
      ),
    );
  }
}

//-- Tabs

//==> Tab1
Widget normalAccountTab(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    height: double.infinity,
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Name",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Your full name",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email address",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Phone Number",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),

          //--- Policies Agreement text
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("By signing up! you accept our ",
                  style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: () {},
                child: Text("Terms ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              Text("& ", style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: () {},
                child: Text("Conditions",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ],
          ),

          const SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
              child: InkWell(
                onTap: () {
                  Get.offAll(
                      () => const PersonalAccountCustomBottomNavigationBar());
                },
                child: Center(
                  child: Text('Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white)),
                ),
              ),
            ),
          ),

          //-- Login Button
          Container(
            margin: const EdgeInsets.only(left: 230, right: 20, top: 25),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 223, 223, 223),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Sign in", style: Theme.of(context).textTheme.bodyMedium),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const PersonalAccountLoginPage());
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

//==> Tab 2
Widget businessAccountTab(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    height: double.infinity,
    width: double.infinity,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Name",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Your full name",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
            child: Text(
              "Brand Name",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Brand name",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email address",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Phone Number",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),

          //--- Policies Agreement text
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("By signing up! you accept our ",
                  style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: () {},
                child: Text("Terms ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              Text("& ", style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: () {},
                child: Text("Conditions",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary)),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
              child: InkWell(
                onTap: () {
                  //  Get.offAll(() => const CustomBottomNavigationBar());
                },
                child: Center(
                  child: Text('Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white)),
                ),
              ),
            ),
          ),

          //-- Login Button
          Container(
            margin: const EdgeInsets.only(
                left: 230, right: 20, top: 17, bottom: 10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 223, 223, 223),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Sign in", style: Theme.of(context).textTheme.bodyMedium),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
