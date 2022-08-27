import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Home/change_theme_button_widget.dart';
import '../Home/checkerpage/checker_page.dart';
import '../Sub-menu/settings/sub_pages/main_settings_page.dart';

class Law_Profile_Page extends StatefulWidget {
  @override
  State<Law_Profile_Page> createState() => _Law_Profile_PageState();
}

class _Law_Profile_PageState extends State<Law_Profile_Page> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: ChangeThemeButtonWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: _height * 0.35,
              width: _width,
              decoration: BoxDecoration(
                color: Color(0xFF303F46),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/getstarted.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 16.0,
                    sigmaY: 16.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50.0, left: 20),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/getstarted.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Text(
                                      "IL POLICE",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontFamily: "Poppins-Medium"),
                                    ),
                                  ),
                                  Text(
                                    "User@gmail.com",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, right: 25),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "TOP ACTIVITIES",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontFamily: "Poppins-Light",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            shape: BoxShape.circle,
                                          ),
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                "assets/pngs/approval.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Verified",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontFamily: "Poppins-SemiBold",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            shape: BoxShape.circle,
                                          ),
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                "assets/pngs/claim2.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Current Claims 0",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black87,
                                              fontFamily: "Poppins-SemiBold",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 38),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainSettingsPage()));
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFF3F4),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Center(
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        letterSpacing: 2,
                        fontFamily: "Poppins-SemiBold",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "INSURANCE",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontFamily: "Poppins-Bold",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 175,
                      width: _width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
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
                                      color: Colors.teal,
                                      fontFamily: 'Poppins-SemiBold',
                                      fontSize: 18),
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
            )
          ],
        ),
      ),
    );
  }
}
