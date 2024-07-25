import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/intro_pages/splash_page.dart';
import 'package:nocturna/View/widgets/customTheme.dart';
import 'Controller/getx_init_page/getx_init_page.dart';

void main() async {
  //-- Initialize Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  //-- Firebase Config
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDAFdvkAzprhRUSGrJu_WMReSCJhYYBbNk',
    appId: '1:714329037530:android:a110f83e4877d4705e63e3',
    messagingSenderId: '714329037530',
    projectId: 'nocturnapro-7aec5',
    storageBucket: 'nocturnapro-7aec5.appspot.com',
  ));

  //-- Getx initialization
  getxInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: customTheme,
    );
  }
}
