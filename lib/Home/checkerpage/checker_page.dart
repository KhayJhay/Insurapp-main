import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell_solid,
              color: Colors.grey,
              size: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 12, left: 15, right: 15),
              child: Container(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: Tab(
                          text: "Checker",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: Tab(
                          text: "My Digital ID",
                        ),
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
