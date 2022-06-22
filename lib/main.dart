// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'Authentication/userCredential.dart';
import 'Home/checkerpage/policy_details.dart';
import 'Home/edit_profile_page.dart';
import 'Home/mainpage.dart';
import 'Home/notifications_page.dart';
import 'Home/settings_page.dart';
import 'OnBording/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: Auth.initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget),
                breakpoints: [
                  ResponsiveBreakpoint.resize(350, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(600, name: TABLET),
                  ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
                ]),
            title: 'Insurapp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            home: FirebaseAuth.instance.currentUser == null
                ? SplashScreen()
                : Mainpage(),
            routes: {
              Edit_Profile_Page.id: (context) => Edit_Profile_Page(),
              Settings_Screen.id: (context) => Settings_Screen(),
              Notifications_Page.id: (context) => Notifications_Page(),
              PolicyDetails.id: (context) => PolicyDetails(),
            },
          );
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Color.fromARGB(255, 0, 225, 255),
          ),
        );
      });
}
