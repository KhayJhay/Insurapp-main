import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/Navigation_drawer/menu_item.dart';

class MenuItems{
  static const profile = MenuItem('Profile', CupertinoIcons.person);
  static const policies = MenuItem('Policy Checker', CupertinoIcons.checkmark_shield);
  static const notifications = MenuItem('Notification', CupertinoIcons.bell);
  static const help = MenuItem('Help', CupertinoIcons.question_circle);
  static const aboutUs = MenuItem('About Us', CupertinoIcons.info_circle);
  static const signOut = MenuItem('Sign Out', CupertinoIcons.square_arrow_right);

  static const all = <MenuItem>[
    profile,
    policies,
    notifications,
    help,
    aboutUs,
    signOut,
  ];

}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor:Color(0xFF1D95DA),
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          ...MenuItems.all.map(buildMenuItem).toList(),
          Spacer(flex: 2,),
        ],
      ),),
  );
  Widget buildMenuItem(MenuItem item) => ListTile(
    minLeadingWidth: 20,
    leading: Icon(item.icon),
    title: Text(item.title),
    onTap: (){

    },
  );
}
