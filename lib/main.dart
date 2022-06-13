// @dart=2.9
import 'package:flutter/material.dart';
import 'package:insurapp/Authentication/google_sign_in.dart';
import 'package:insurapp/Home/Navigation_drawer/navigation_main_page.dart';
import 'package:insurapp/Home/mainpage.dart';
import 'package:insurapp/OnBording/get_started.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'Home/edit_profile_page.dart';
import 'Home/notifications_page.dart';
import 'Home/settings_page.dart';
import 'OnBording/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=> ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      builder: (context,widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget),
          breakpoints: [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ]
      ),
      title: 'Insurapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: SplashScreen(),
      routes: {
        Edit_Profile_Page.id: (context) => Edit_Profile_Page(),
        Settings_Screen.id: (context) => Settings_Screen(),
        Notifications_Page.id: (context) => Notifications_Page(),
      },
    ),
  );
}
