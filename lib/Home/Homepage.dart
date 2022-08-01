import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/change_theme_button_widget.dart';
import 'package:insurapp/Home/checkerpage/checker_page.dart';
import 'package:insurapp/Home/notifications_page.dart';
import 'package:insurapp/Sub-menu/services.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:insurapp/Sub-menu/about_insurapp.dart';
import 'package:insurapp/Sub-menu/contact_page.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Models/users.dart';
import '../Sub-menu/help&support/help&support.dart';
import '../Sub-menu/settings/sub_pages/main_settings_page.dart';
import '../providers/notify_provider.dart';
import '../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isOpen = false;

  //getting users by default
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
    final shadowcolor = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    setState(() {
      isOpen = Provider.of<NotificationProvider>(context).isRead;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbar_color,
        toolbarHeight: 75,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: ChangeThemeButtonWidget(),
        actions: [
          Stack(
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications_Page()));
                    NotificationProvider().changeToRead(false);
                  },
                  icon: Icon(
                    CupertinoIcons.bell_solid,
                    color: Colors.grey,
                    size: 26,
                  ),
                ),
              ),
              isOpen
                  ? Positioned(
                      right: 9,
                      top: 20,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ))
                  : SizedBox()
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Welcome ${loggedInUser.username}!",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins-Medium",
                    color: bodytext_color,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 30, bottom: 15),
              child: Text(
                "Check Policy Validity",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Bold",
                  color: bodytext_color,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 30),
                  child: Container(
                    height: 175,
                    width: _width * 0.95,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: shadowcolor.withOpacity(0.09),
                            blurRadius: 10,
                            spreadRadius: 3),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 20, bottom: 20),
                              child: Text(
                                "Is Your Insurance\n Policy Valid?",
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    color: bodytext_color,
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Checker_Page()));
                                },
                                child: Container(
                                  height: 42,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF44A8E0),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF44A8E0),
                                          blurRadius: 4,
                                          spreadRadius: 1),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Check Here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: 130,
                            width: 160,
                            child: Lottie.asset('assets/lotties/check.json'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                "Sub Menu",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Bold",
                  color: bodytext_color,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8, bottom: 0),
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF44A8E0),
                                Color(0xFFA7CD3A),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              )
                            ]),
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.chat_bubble_2,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Help_Support()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Customer\nSupport",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF44A8E0),
                                Color(0xFFA7CD3A),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              )
                            ]),
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.phone,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact_Us()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF44A8E0),
                                Color(0xFFA7CD3A),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              )
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.briefcase,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Services()));
                            },
                          ),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 3,
                                spreadRadius: 4,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF44A8E0),
                                Color(0xFFA7CD3A),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.gear_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, MainSettingsPage.id);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF44A8E0),
                                Color(0xFFA7CD3A),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.bell_fill,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Notifications_Page.id);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF44A8E0),
                                  Color(0xFFA7CD3A),
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 3,
                                  spreadRadius: 4,
                                )
                              ],
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.info_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => About_Insurapp()));
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "About Insurapp",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Popping-Light',
                          color: bodytext_color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                "Our Services",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF303F46),
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
              child: Container(
                  height: 200,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              color: Color(0xFFE8F3F3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/roadside.jpg",
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "RoadSide\nAssistance",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins-SemiBold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              color: Color(0xFFE8F3F3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/virtual.jpg",
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Virtual\nAssistance",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins-SemiBold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              color: Color(0xFFE8F3F3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/digital.jpg",
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Digital\nID",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins-SemiBold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              color: Color(0xFFE8F3F3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/pngs/logobg2.png",
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Why You Should\nChoose Us",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins-SemiBold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  )),
            ),
            */
          ],
        ),
      ),
    );
  }
}
