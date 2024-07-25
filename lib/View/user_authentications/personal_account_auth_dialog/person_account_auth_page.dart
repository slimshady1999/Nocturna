import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/personal_account_user_auth_controller.dart';
import 'package:nocturna/Controller/user_auth_controller/personal_account_user_auth_controller/personal_account_user_register_auth_controller.dart';
import 'package:nocturna/Controller/validations/form_validations.dart';

class PersonAccountLoginDialog {
  //-- Login Dialog
  static personalAccountLogingDialog() {
    final controller = Get.put(PersonalAccountLoginController());
    return showDialog(
        context: Get.context!,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 70),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Form(
                        key: controller.personalAccountLoginKey,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),

                                //-- forms
                                Padding(
                                  padding: const EdgeInsets.only(left: 83.5),
                                  child: Image.asset(
                                    'assets/logo_new.png',
                                    width: 150,
                                    height: 70,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.5, bottom: 8),
                                  child: Text(
                                    'Email',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 24, left: 24),
                                  child: TextFormField(
                                    controller: controller.emailController,
                                    cursorColor: Colors.black,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    validator: (value) =>
                                        FormValidation.emailValidate(value),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          61, 158, 158, 158),
                                      hintText: 'Email',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.5, bottom: 8),
                                  child: Text(
                                    'Password',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    cursorColor: Colors.black,
                                    obscureText: true,
                                    validator: (value) =>
                                        FormValidation.passwordValidation(
                                            value),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          61, 158, 158, 158),
                                      hintText: 'Password',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                ),

                                //-- Forgot password
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 22.0),
                                      child: TextButton(
                                        onPressed: () {
                                          PersonAccountLoginDialog
                                              .forgotPasswordDialog();
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //-- Login button
                                const SizedBox(height: 24),
                                Container(
                                  height: 60,
                                  margin: const EdgeInsets.only(
                                      right: 20, left: 20),
                                  width: double.infinity,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.deepPurple,
                                    child: InkWell(
                                      onTap: () {
                                        controller
                                            .personalAccountLoginController();
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
                                    Get.back();
                                    personalAccountRegisterDialog();
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Not registered?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Register now',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                          ),
                                        ),
                                      ]),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  //--Personal Account Register Dialog
  static personalAccountRegisterDialog() {
    final controller = Get.put(PersonalAccountRegisterController());
    return showDialog(
        context: Get.context!,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      height: MediaQuery.of(context).size.height / 1.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Form(
                        key: controller.personalAccountRegisterKey,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),

                                //-- forms
                                Padding(
                                  padding: const EdgeInsets.only(left: 83.5),
                                  child: Image.asset(
                                    'assets/logo_new.png',
                                    width: 150,
                                    height: 70,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Text(
                                    "Name",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: TextFormField(
                                    controller: controller.fullnameController,
                                    validator: (value) =>
                                        FormValidation.fullnameVerification(
                                            value),
                                    decoration: InputDecoration(
                                        hintText: "Your full name",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 223, 223, 223),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 10),
                                  child: Text(
                                    "Email",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                    controller: controller.emailController,
                                    validator: (value) =>
                                        FormValidation.emailValidate(value),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "Email address",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 223, 223, 223),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Text(
                                    "Phone Number",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextFormField(
                                    controller:
                                        controller.phonenumberController,
                                    validator: (value) =>
                                        FormValidation.phoneNumberValidate(
                                            value),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "Phone Number",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 223, 223, 223),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Text(
                                    "Password",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    validator: (value) =>
                                        FormValidation.passwordValidation(
                                            value),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 223, 223, 223),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),

                                //--- Policies Agreement text
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("By signing up! you accept our ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text("Terms ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary)),
                                    ),
                                    Text("& ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text("Conditions",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary)),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 25),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  height: 60,
                                  width: double.infinity,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.deepPurple,
                                    child: InkWell(
                                      onTap: () {
                                        controller
                                            .personalAccountRegisterController();
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
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    personalAccountLogingDialog();
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already a member?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Login',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                          ),
                                        ),
                                      ]),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  //-- Forgot Password
  static forgotPasswordDialog() {
    // final controller = Get.put(PersonalAccountLoginController());
    return showDialog(
        context: Get.context!,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 210),
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                    'Enter your registered email address below',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                              const SizedBox(height: 35),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 24, left: 24),
                                child: TextField(
                                  // controller: controller.emailController,
                                  cursorColor: Colors.black,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 223, 223, 223),
                                    hintText: 'Email',
                                    hintStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),

                              //-- Login button
                              const SizedBox(height: 24),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 15),
                                height: 60,
                                width: double.infinity,
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
                            ]))
                  ],
                ),
              ),
            ));
  }

//-- Logout Password
  static personAccountLogoutDialog() {
    final controller = Get.put(PersonalAccountLoginController());
    return showDialog(
        context: Get.context!,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, top: 210),
                        height: MediaQuery.of(context).size.height / 2.7,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(children: [
                          const SizedBox(height: 50),
                          Text('Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.red)),
                          const SizedBox(height: 20),
                          Text('Are You Sure?',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //-- Yes, Quit
                              Container(
                                margin: const EdgeInsets.only(left: 15),
                                height: 60,
                                width: 140,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () {
                                      controller.logOut();
                                    },
                                    child: Center(
                                      child: Text('Yes, Quit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),

                              //-- No, go back
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  height: 60,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(130, 104, 58, 183),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text('No, Cancel',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]))
                  ],
                ),
              ),
            ));
  }
}
