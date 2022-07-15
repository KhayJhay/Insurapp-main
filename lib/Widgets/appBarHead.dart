import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/notifications_page.dart';
import '../providers/notify_provider.dart';
import '../providers/theme_provider.dart';

class HeaderAppBar extends StatefulWidget {
  final Widget child;
  HeaderAppBar({Key? key, required this.child}) : super(key: key);

  @override
  State<HeaderAppBar> createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    isOpen = Provider.of<NotificationProvider>(context).isRead;
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Colors.black;
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
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
      body: widget.child,
    );
  }
}
