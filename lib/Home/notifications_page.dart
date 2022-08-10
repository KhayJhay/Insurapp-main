import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:insurapp/Models/noty_model.dart';
import 'package:insurapp/Widgets/appBarHead.dart';
import 'package:insurapp/providers/notify_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Widgets/notificationCard.dart';
import '../providers/theme_provider.dart';

class Notifications_Page extends StatefulWidget {
  static String id = 'notifications_page';
  const Notifications_Page({Key? key}) : super(key: key);

  @override
  State<Notifications_Page> createState() => _Notifications_PageState();
}

class _Notifications_PageState extends State<Notifications_Page> {
  List<NotificationModel> notifyList = [];
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    notifyList = Provider.of<NotificationProvider>(context).notify;
    return HeaderAppBar(
      child: SafeArea(
        child: SingleChildScrollView(
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
                child: Center(
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Medium",
                      color: bodytext_color,
                    ),
                  ),
                ),
              ),
              notifyList.isNotEmpty
                  ? SizedBox(
                      height: _height,
                      child: ListView.builder(
                        itemCount: notifyList.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: NotificationCard(notify: notifyList[index]),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 200,
                              width: 200,
                              child: Lottie.asset("assets/lotties/notif.json")),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "No notifications recieved, make sure notifications are turned on. Click on the link below to check your settings",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins-Light",
                                  color: bodytext_color,
                                ),
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Settings_Screen.id);
                            },
                            child: Text(
                              "Check Settings",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins-SemiBold",
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
