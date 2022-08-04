// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:insurapp/Home/profile_page.dart';
import 'package:insurapp/Sub-menu/settings/sub_pages/change_password.dart';
import 'package:provider/provider.dart';

import '../../Authentication/userCredential.dart';
import '../../Models/insura_.model.dart';
import '../../providers/dig_providers.dart';
import '../../providers/theme_provider.dart';

class Settings_Screen extends StatefulWidget {
  static String id = 'settings_page';
  const Settings_Screen({Key? key}) : super(key: key);

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    DigitalIDModel digitalIDModel =
        Provider.of<DigitalProvider>(context).digitalIDModel;
    bool isActive = false;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE8F3F3);
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Colors.white;
    final welcome_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE3E7E8);
    final bodytext_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Color(0xFF303F46);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: appbar_color,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilPage(),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.grey,
              size: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: welcome_color,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
              ),
              child: Center(
                child: Text(
                  "Account Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Medium",
                    color: bodytext_color,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: digitalIDModel.profile == ''
                            ? AssetImage("assets/images/profile.jpg")
                            : AssetImage("${digitalIDModel.profile}"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildChangePassword(),
            buildDelete(),
            buildLanguage(),
            buildSecurity(),
            buildPrivacy(),
          ],
        ),
      ),
    );
  }

  Widget buildChangePassword() => ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          child: Center(
            child: Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),
        ),
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.QUESTION,
            animType: AnimType.SCALE,
            title: 'Change Password',
            desc: 'Your password is being changed',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Auth.signout(context: context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => ChangePassword_Page()),
                );
              });
            },
          )..show();
        },
      );
  Widget buildDelete() => ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pinkAccent,
          ),
          child: Center(
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Delete Account",
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),
        ),
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Delete Account',
            desc: 'Are you sure you want to delete your account?',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        },
      );
  Widget buildLanguage() => ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.indigo,
          ),
          child: Center(
            child: Icon(
              Icons.description,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Change Language",
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),
        ),
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.SCALE,
            title: 'Change Language',
            desc: 'Language cannot be changed now',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        },
      );
  Widget buildSecurity() => ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightGreen,
          ),
          child: Center(
            child: Icon(
              Icons.security,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Security",
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),
        ),
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Security',
            desc: 'Your Account is Secured',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        },
      );
  Widget buildPrivacy() => ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
          child: Center(
            child: Icon(
              Icons.privacy_tip,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Privacy and Policies",
          style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),
        ),
        onTap: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.SCALE,
            title: 'Privacy and Policy',
            desc: 'You have no privacy and policy document now',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        },
      );
}
