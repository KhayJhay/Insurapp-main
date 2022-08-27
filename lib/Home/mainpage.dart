import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/Homepage.dart';
import 'package:insurapp/Home/claims_page.dart';
import 'package:insurapp/Home/discover_page.dart';
import 'package:insurapp/Home/profile_page.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:insurapp/Sub-menu/settings/sub_pages/main_settings_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Sub-menu/help&support/help&support.dart';
import '../providers/theme_provider.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int index = 0;
  int _selectedIndex = 0;
  static final List<Widget> _navScreens = <Widget>[
    HomePage(),
    Claims_Page(),
    ProfilPage(),
    MainSettingsPage(),
  ];

  final pages = [
    HomePage(),
    Help_Support(),
    Discover_Page(),
    ProfilPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Colors.white;
    final text_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.grey;
    final tab_bgcolor =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Color(0xFF44A8E0)
            : Colors.grey[100]!;
    return Scaffold(
      body: _navScreens.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: appbar_color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Color(0xFFA7CD3A),
                textStyle: TextStyle(fontFamily: 'Poppins-Light', fontSize: 12),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: tab_bgcolor,
                color: text_color,
                tabs: [
                  GButton(
                    icon: CupertinoIcons.square_stack_3d_up,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.commentAlt,
                    text: 'Claims',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                  GButton(
                    icon: CupertinoIcons.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
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
