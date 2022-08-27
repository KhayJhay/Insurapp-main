import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurapp/Home/change_theme_button_widget.dart';
import 'package:insurapp/Home/checkerpage/checker_page.dart';
import 'package:insurapp/Home/discover_page.dart';
import 'package:insurapp/Home/notifications_page.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:insurapp/Sub-menu/help&support/tips_page.dart';
import 'package:insurapp/Sub-menu/road_assistance_page.dart';
import 'package:insurapp/Sub-menu/services.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:insurapp/Sub-menu/about_insurapp.dart';
import 'package:insurapp/Sub-menu/contact_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Models/users.dart';
import '../Sub-menu/help&support/help&support.dart';
import '../Sub-menu/settings/sub_pages/main_settings_page.dart';
import '../providers/dig_providers.dart';
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
    final shadowcolor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black;
    final mini_iconbg =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Color.fromARGB(255, 42, 108, 231).withOpacity(0.1);
    final mini_iconcolor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Color(0xFF44A8E0)
            : Color.fromARGB(255, 42, 124, 231);
    final picbtn_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade500
            : Colors.white;
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
                child: DelayedDisplay(
                  delay: Duration(seconds: 1),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 30, bottom: 15),
              child: DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Text(
                  "Check Policy Validity",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Bold",
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 30),
                  child: DelayedDisplay(
                    delay: Duration(seconds: 1),
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
                ),
              ],
            ),
            DelayedDisplay(
              delay: Duration(seconds: 1),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Discover_Page()));
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        color: mini_iconbg,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 3,
                                            spreadRadius: 4,
                                          )
                                        ]),
                                    child: Icon(
                                      CupertinoIcons.globe,
                                      size: 40,
                                      color: mini_iconcolor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Discover",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Discover_Page()));
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        color: mini_iconbg,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 3,
                                            spreadRadius: 4,
                                          )
                                        ]),
                                    child: Icon(
                                      CupertinoIcons.location_fill,
                                      size: 40,
                                      color: mini_iconcolor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "GPS",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tips_Page()));
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        color: mini_iconbg,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 3,
                                            spreadRadius: 4,
                                          )
                                        ]),
                                    child: Icon(
                                      CupertinoIcons.lightbulb,
                                      size: 40,
                                      color: mini_iconcolor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Tips",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Contact_Us()));
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        color: mini_iconbg,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 3,
                                            spreadRadius: 4,
                                          )
                                        ]),
                                    child: Icon(
                                      FontAwesomeIcons.phoneFlip,
                                      size: 40,
                                      color: mini_iconcolor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Contact Us",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins-Medium',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15, top: 30),
              child: DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Text(
                  "Sub Menu",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Bold",
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartClaim()));
                    },
                    child: Container(
                      height: _height * 0.17,
                      width: _width,
                      decoration: BoxDecoration(
                        color: picbtn_color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: shadowcolor.withOpacity(0.09),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _height * 0.17,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/call.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.indigoAccent.withOpacity(0.5),
                                    ),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Text(
                                  "Start Claim",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 8),
                                child: AutoSizeText(
                                  "Insurapp provides support \nfor clients through information, \nassistance and creating\n a trusting environment",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 4,
                                  maxFontSize: 13,
                                  minFontSize: 9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
                child: DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Road_Assistance_Page()));
                    },
                    child: Container(
                      height: _height * 0.17,
                      width: _width,
                      decoration: BoxDecoration(
                        color: picbtn_color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: shadowcolor.withOpacity(0.09),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _height * 0.17,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/towing.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lime.withOpacity(0.5),
                                    ),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Text(
                                  "Road Assistance",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 8),
                                child: AutoSizeText(
                                  "Insurapp provides support \nfor clients through information, \nassistance and creating\n a trusting environment",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 3,
                                  maxFontSize: 13,
                                  minFontSize: 9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: DelayedDisplay(
                  delay: Duration(seconds: 1),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Help_Support()));
                    },
                    child: Container(
                      height: _height * 0.17,
                      width: _width,
                      decoration: BoxDecoration(
                        color: picbtn_color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: shadowcolor.withOpacity(0.09),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _height * 0.17,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/customer.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.5),
                                    ),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Text(
                                  "Customer Support",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 8),
                                child: AutoSizeText(
                                  "Insurapp provides support \nfor clients through information, \nassistance and creating\n a trusting environment",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 3,
                                  maxFontSize: 13,
                                  minFontSize: 9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: DelayedDisplay(
                  delay: Duration(seconds: 2),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Services()));
                    },
                    child: Container(
                      height: _height * 0.17,
                      width: _width,
                      decoration: BoxDecoration(
                        color: picbtn_color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: shadowcolor.withOpacity(0.09),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _height * 0.17,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/ins.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.5),
                                    ),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Text(
                                  "Insurapp Services",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 8),
                                child: AutoSizeText(
                                  "Insurapp provides support \nfor clients through information, \nassistance and creating\n a trusting environment",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 3,
                                  maxFontSize: 13,
                                  minFontSize: 9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: DelayedDisplay(
                  delay: Duration(seconds: 4),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => About_Insurapp()));
                    },
                    child: Container(
                      height: _height * 0.17,
                      width: _width,
                      decoration: BoxDecoration(
                        color: picbtn_color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: shadowcolor.withOpacity(0.09),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _height * 0.17,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/serv.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.cyanAccent.withOpacity(0.5),
                                    ),
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
                                child: Text(
                                  "About Insurapp",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold', fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 8),
                                child: AutoSizeText(
                                  "Insurapp provides support \nfor clients through information, \nassistance and creating\n a trusting environment",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                  ),
                                  maxLines: 3,
                                  maxFontSize: 13,
                                  minFontSize: 9,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
