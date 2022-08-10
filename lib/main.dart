// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Sub-menu/settings/sub_pages/main_settings_page.dart';
import 'package:insurapp/providers/notify_provider.dart';
import 'package:insurapp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'Authentication/userCredential.dart';
import 'Home/edit_profile_page.dart';
import 'Home/mainpage.dart';
import 'Home/notifications_page.dart';
import 'Sub-menu/settings/settings_page.dart';
import 'OnBording/splash_screen.dart';
import 'providers/dig_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => DigitalProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => NotificationProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
        ],
        child: FutureBuilder(
            future: Auth.initializeFirebase(),
            builder: (context, snapshot) {
              final themeProvider = Provider.of<ThemeProvider>(context);
              if (snapshot.hasError) {
                print("ERROR ${snapshot.error}");
                return MaterialApp(
                    home: Scaffold(
                        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // fontStyle: un
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please report the following Error to you developers",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: SelectableText("ERROR: ${snapshot.error}"),
                    ),
                  ],
                )));
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
                  themeMode: themeProvider.themeMode,
                  theme: MyThemes.lightTheme,
                  darkTheme: MyThemes.darkTheme,
                  home: FirebaseAuth.instance.currentUser == null
                      ? SplashScreen()
                      : Mainpage(),
                  // : Checker_Page(),
                  routes: {
                    Edit_Profile_Page.id: (context) => Edit_Profile_Page(),
                    Settings_Screen.id: (context) => Settings_Screen(),
                    MainSettingsPage.id: (context) => MainSettingsPage(),
                    Notifications_Page.id: (context) => Notifications_Page(),
                  },
                );
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 0, 225, 255),
                ),
              );
            }),
      );
}
