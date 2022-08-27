// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:insurapp/Authentication/userCredential.dart';
import 'package:insurapp/Sub-menu/contact_page.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:provider/provider.dart';
import '../../../Authentication/login&register_page.dart';
import '../../../Home/change_theme_button_widget.dart';
import '../../../Home/profile_page.dart';
import '../../../Models/users.dart';
import '../../../providers/theme_provider.dart';

class MainSettingsPage extends StatefulWidget {
  static String id = 'main_settings_page';
  const MainSettingsPage({Key? key}) : super(key: key);

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromJson(value.data());
      setState(() {});
    });
  }


  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE8F3F3);
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
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
                      builder: (context) => ProfilPage()));
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
                  "Settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Medium",
                    color: bodytext_color,
                  ),
                ),
              ),
            ),
            buildUserProfile(),
            SettingsTileGroup(title: 'GENERAL',
                children: <Widget>[
                  buildAccountSettings(),
                  buildDarkMode(),
                  buildDelete(),
                  buildLogout(),
                ]),
            SettingsTileGroup(title: 'FEEDBACK',
                children: <Widget>[
                  buildReport(),
                  buildRateUs(),
                ]),
          ],
        ),
      ),
    );
  }
  Widget buildUserProfile() => Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/pngs/logobg1.png",),
          radius: 40,
        ),
        title: Text("${loggedInUser.username}", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
        subtitle: Text("${loggedInUser.email}",style: TextStyle(fontSize: 13, fontFamily: 'Poppins-Light'),),
        trailing: Icon(CupertinoIcons.chevron_forward, color: Colors.grey,),
      ),
    ),
  );
  Widget buildDarkMode() => ListTile(
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo
      ),
      child: Center(
        child: Icon(CupertinoIcons.moon_stars_fill, color: Colors.white,),
      ),
    ),
    title: Text("Change App Theme", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
    trailing: ChangeThemeButtonWidget(),
  );
  Widget buildLogout() => ListTile(
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueAccent,
      ),
      child: Center(
        child: Icon(Icons.login_outlined, color: Colors.white,),
      ),
    ),
    title: Text("Logout", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
    onTap: () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: 'Logout',
        desc: 'You are sign out of your account',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Auth.signout(context: context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => Login_Register_Page()),
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
        child: Icon(Icons.delete, color: Colors.white,),
      ),
    ),
    title: Text("Delete", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
    onTap: (){
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
  Widget buildAccountSettings() => ListTile(
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: Center(
        child: Icon(Icons.person, color: Colors.white,),
      ),
    ),
    title: Text("Account Settings", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
    subtitle: Text("Policy,Security,Language", style: TextStyle(fontSize: 12, fontFamily: 'Poppins-Light'),),
    trailing: Icon(Icons.chevron_right),
    onTap: (){
      Navigator.of(context).pushNamed(Settings_Screen.id);
    },
  );
  Widget buildReport() => Padding(
    padding: const EdgeInsets.only(top: 15),
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal,
        ),
        child: Center(
          child: Icon(Icons.bug_report_rounded, color: Colors.white,),
        ),
      ),
      title: Text("Report a Bug", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
      onTap: (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Contact_Us()),
        );
      },
    ),
  );
  Widget buildRateUs() => ListTile(
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:Colors.blueAccent,
      ),
      child: Center(
        child: Icon(Icons.star, color: Colors.white),
      ),
    ),
    title: Text("Rate Us", style: TextStyle(fontSize: 14, fontFamily: 'Poppins-Medium'),),
    onTap: (){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Rated Successfully',
        desc: 'You have successfully rated insurapp ',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    },
  );
}
