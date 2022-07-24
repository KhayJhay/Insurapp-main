// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:insurapp/Home/profile_page.dart';
import 'package:provider/provider.dart';

import '../Authentication/userCredential.dart';
import '../Authentication/login&register_page.dart';
import '../providers/theme_provider.dart';

class Settings_Screen extends StatelessWidget {
  static String id = 'settings_page';
  const Settings_Screen({Key? key}) : super(key: key);

  @override
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 650,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildAccountOptionRow(context, "Change password"),
                    buildAccountOptionRow(context, "Content settings"),
                    buildAccountOptionRow(context, "Policies"),
                    buildAccountOptionRow(context, "Language"),
                    buildAccountOptionRow(context, "Privacy and security"),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      height: 15,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildNotificationOptionRow("Policy Updates", true),
                    buildNotificationOptionRow("Customer Support", true),
                    buildNotificationOptionRow("RoadSide Assistance", false),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          SchedulerBinding.instance!.addPostFrameCallback((_) {
                            Auth.signout(context: context);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Login_Register_Page()),
                            );
                          });
                        },
                        child: Text("SIGN OUT",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                               )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins-Light",
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Poppins-Light",
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
