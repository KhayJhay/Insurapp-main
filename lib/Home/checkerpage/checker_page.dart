import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/appBarHead.dart';
import '../../Widgets/checker/cheackerTapCard.dart';
import '../../Widgets/checker/myDigitalCard.dart';
import '../../providers/theme_provider.dart';

class Checker_Page extends StatefulWidget {
  const Checker_Page({Key? key}) : super(key: key);

  @override
  State<Checker_Page> createState() => _Checker_PageState();
}

class _Checker_PageState extends State<Checker_Page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int bottomTab = 0;

  var key;

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE8F3F3);
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Colors.white;
    final welcome_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE3E7E8);
    final bodytext_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Color(0xFF303F46);
    return HeaderAppBar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Container(
                width: _width * 0.43,
                decoration: BoxDecoration(
                    color: Color(0xFFE3E7E8),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: appbar_color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onTap: (newIndex) {
                      print(newIndex);
                      setState(() {
                        currentIndex = newIndex;
                      });
                    },
                    unselectedLabelStyle: TextStyle(
                      color: Colors.deepPurple.shade300,
                      fontSize: 13,
                      fontFamily: 'Poppins-Bold',
                    ),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontFamily: 'Poppins-Bold'),
                    isScrollable: true,
                    labelColor: Color(0xFF44A8E0),
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: "Checker",
                      ),
                      Tab(
                        text: "Digital ID",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: _height,
              child: TabBarView(
                children: [
                  CheckerTab(),
                  My_Digital_ID(),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
