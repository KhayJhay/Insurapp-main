import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/Homepage.dart';
import 'package:insurapp/Home/discover_page.dart';
import 'package:insurapp/Home/profile_page.dart';
import 'package:insurapp/Home/start_claim.dart';

import '../Sub-menu/help&support/help&support.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int index = 0;

  final pages = [
    HomePage(),
    Help_Support(),
    Discover_Page(),
    ProfilPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StartClaim()));
        },
        backgroundColor: Color(0xFF44A8E0),
        tooltip: 'Publish?',
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomNavBar_Widget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

class BottomNavBar_Widget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const BottomNavBar_Widget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<BottomNavBar_Widget> createState() => _BottomNavBar_WidgetState();
}

class _BottomNavBar_WidgetState extends State<BottomNavBar_Widget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );
    return BottomAppBar(
      elevation: 8.0,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(CupertinoIcons.home, color: Colors.grey),
          ),
          buildTabItem(
            index: 1,
            icon: Icon(CupertinoIcons.question_circle, color: Colors.grey),
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(CupertinoIcons.search, color: Colors.grey),
          ),
          buildTabItem(
            index: 3,
            icon: Icon(CupertinoIcons.person, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;
    return IconTheme(
        data: IconThemeData(
          color: isSelected ? Colors.lightBlueAccent : Colors.grey,
        ),
        child: IconButton(
          onPressed: () => widget.onChangedTab(index),
          icon: icon,
        ));
  }
}
