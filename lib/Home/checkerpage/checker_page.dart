import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/appBarHead.dart';
import '../../Widgets/checker/cheackerTapCard.dart';
import '../../Widgets/checker/myDigitalCard.dart';

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
    double _width= MediaQuery.of(context).size.width;
    return HeaderAppBar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                 vertical: 30, horizontal: 15),
              child: Container(
                width: _width * 0.53,
                decoration: BoxDecoration(
                    color: Color(0xFFE3E7E8),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.white,
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
                      fontSize: 16,
                      fontFamily: 'Poppins-Bold',
                    ),
                    labelStyle: TextStyle(
                        color: Color(0xFF303F46),
                        fontSize: 20,
                        fontFamily: 'Poppins-Bold'),
                    indicatorColor: Colors.teal,
                    isScrollable: true,
                    labelColor: Colors.teal,
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
