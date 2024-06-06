import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nocturna/Controller/getx_init_page/geyx_init_page.dart';
import 'package:nocturna/View/intro_pages/spalsh_page.dart';
import 'package:nocturna/View/widgets/customTheme.dart';
import 'package:nocturna/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //-- Getx initialization
  getxInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          theme: customTheme,
        );
      },
    );
  }
}
















// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       builder: (context, child) {
//         ScreenUtil.init(context);
        
//       },

//       theme: customTheme,
//       debugShowCheckedModeBanner: false,
//       home: const SplashPage(),
//       // initialRoute: '/',
//       // routes: {
//       //   '/': (context) => SplashScreen(),
//       //   '/login': (context) => LoginScreen(),
//       //   '/registration': (context) => RegistrationScreen(),
//       // },
//     );
//   }
// }