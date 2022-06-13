import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:insurapp/Home/mainpage.dart';
import 'package:insurapp/Home/Navigation_drawer/menu_page.dart';
class Navigation_Drawer_Mainpage extends StatefulWidget {
  const Navigation_Drawer_Mainpage({Key? key}) : super(key: key);

  @override
  State<Navigation_Drawer_Mainpage> createState() => _Navigation_Drawer_MainpageState();
}

class _Navigation_Drawer_MainpageState extends State<Navigation_Drawer_Mainpage> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) => ZoomDrawer(
      menuScreen: MenuPage(),
      mainScreen: Mainpage(),
    borderRadius: 24,
    controller: _drawerController,
    showShadow: true,
    angle: -12.0,
    drawerShadowsBackgroundColor: Colors.grey,
    slideWidth: MediaQuery.of(context).size.width * 0.65,
  );
}
