import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone_usiflutter/responsive/mobile_screen_layout.dart';
import 'package:insta_clone_usiflutter/responsive/responsive_screen_layout.dart';
import 'package:insta_clone_usiflutter/responsive/web_screen_layout.dart';
import 'package:insta_clone_usiflutter/screens/login_screen.dart';
import 'package:insta_clone_usiflutter/screens/signup_screen.dart';
import 'package:insta_clone_usiflutter/utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDUHpNyKNbnRJg8tltXlhBMjJ2B1xPBeBo',
          appId: '1:795559543612:web:5c95aa8f63409a393f9439',
          messagingSenderId: '795559543612',
          projectId: 'insta-clone-49536',
          storageBucket: "insta-clone-49536.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}

// const Scaffold(
        //   body: Center(
        //       child: Text(
        //     "Instagram",
        //     style: TextStyle(fontFamily: "Satisfy", fontSize: 40),
        //   )),
        // ),