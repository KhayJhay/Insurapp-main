import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/notifications_page.dart';
import '../providers/notify_provider.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F4),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
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
