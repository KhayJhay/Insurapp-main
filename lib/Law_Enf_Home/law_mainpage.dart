import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:insurapp/Home/claims_page.dart';
import 'package:insurapp/Home/profile_page.dart';
import 'package:insurapp/Law_Enf_Home/law_home.dart';
import 'package:insurapp/Law_Enf_Home/profile.dart';
import 'package:line_icons/line_icons.dart';

class Law_Main_Page extends StatefulWidget {
  @override
  State<Law_Main_Page> createState() => _Law_Main_PageState();
}

class _Law_Main_PageState extends State<Law_Main_Page> {
  int index = 0;
  int _selectedIndex = 0;
  static final List<Widget> _navScreens = <Widget>[
    LawEnforcer(),
    Claims_Page(),
    Law_Profile_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _navScreens.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
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
                tabBackgroundColor: Color(0xFFECF3EC),
                color: Colors.black54,
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
}
