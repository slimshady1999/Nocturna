import 'package:flutter/material.dart';

class BusinessAcountForgotPasswordPage extends StatelessWidget {
  const BusinessAcountForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text('Enter your registered email address below!',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: TextField(
                // controller: controller.emailController,
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

            //-- Login button
            const SizedBox(height: 24),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width / 1.6,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,
                child: InkWell(
                  onTap: () {
                    // _loginUser(_emailController.text,
                    //     _passwordController.text, context);
                  },
                  child: Center(
                    child: Text('Verify',
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
      )),
    );
  }
}
