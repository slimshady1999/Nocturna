import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/user_auth_controller/login_controller.dart';
import 'package:nocturna/View/intro_pages/user_role_screen.dart';
import 'package:nocturna/View/user_authentications/personal_account_auth/personal_forgot_password_page.dart';
import 'package:nocturna/View/widgets/personal_account_bottom_navigation_bar.dart';

class PersonalAccountLoginPage extends StatelessWidget {
  const PersonalAccountLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo_new.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: TextField(
                controller: controller.emailController,
                cursorColor: Colors.black,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  hintText: 'Email',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 223, 223, 223),
                  hintText: 'Password',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),

            //-- Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 22.0),
                  child: TextButton(
                    onPressed: () {
                      // // Navigate to forgot password screen
                      Get.to(() => const PersonalAccountForgotPasswordPage());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),

            //-- Login button
            const SizedBox(height: 24),
            Container(
              height: 60,
              margin: const EdgeInsets.only(right: 20, left: 20),
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
                    child: Text('Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // // Navigate to registration screen
                Get.to(() => const UserRole());
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Not registered?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Register now',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ]),
            ),

            //-- Facebook Login
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 30,
              child: Image.asset(
                'assets/facebook_logo.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
