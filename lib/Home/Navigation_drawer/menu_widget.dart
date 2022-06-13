import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
class Menuwidget extends StatelessWidget {
  const Menuwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(onPressed: ()=> ZoomDrawer.of(context)!.toggle(), icon: Icon(
    CupertinoIcons.slider_horizontal_3,
    color: Colors.grey,
    size: 26,
  ),);
}
