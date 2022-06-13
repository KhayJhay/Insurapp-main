import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data_service/insura_data.dart';

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
                    tabs: <Widget>[
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

class CheckerTab extends StatefulWidget {
  const CheckerTab({Key? key}) : super(key: key);

  @override
  State<CheckerTab> createState() => _CheckerTabState();
}

class _CheckerTabState extends State<CheckerTab> {
  final idNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            width: _width,
            decoration: BoxDecoration(
              color: Color(0xFFE8F3F3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 3),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60.0, right: 60, top: 30),
                  child: Lottie.asset('assets/lotties/check.json'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Hello, Koya Brown! Check Your \nVehicle Policy Status Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                          color: Color(0xFF303F46),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: idNumberController,
                          onSaved: (value) {
                            idNumberController.text = value.toString();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Policy Number",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          InsuraData()
                              .checker(context, idNumberController.text);
                        },
                        child: Container(
                          height: 60,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xFF6F8827),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Policy Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: _width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 340,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.ellipsis,
                                color: Color(0xFF303F46),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.check_mark_circled,
                          size: 60,
                          color: Color(0xFFA7CD3A),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Insurance Policy Active",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nPhilip & Cater Insurance PLC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA7CD3A),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            "\nInsurance type: Vehicle Insurance",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: "Poppins-Regular",
                                        )),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, right: 25, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "REVIEW",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SEND MEMO",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class My_Digital_ID extends StatelessWidget {
  const My_Digital_ID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "Digital ID & Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: _width,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 340,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.ellipsis,
                                color: Color(0xFF303F46),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/profile.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Koya Brown",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  "
                                          "Verified",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF1D95DA),
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nAutomotive Policy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\nCurrent rate of \$56.23/month",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: "Poppins-Regular",
                                        )),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 90,
                            child: Image.asset(
                              "assets/pngs/benlog.png",
                            )),
                        Image.asset(
                          "assets/pngs/benz2.png",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, right: 25, left: 25),
                    child: Center(
                      child: Text(
                        "VIEW FULL ID",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          letterSpacing: 2,
                          fontFamily: "Poppins-SemiBold",
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "ID Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: _width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 340,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.ellipsis,
                                color: Color(0xFF303F46),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.check_mark_circled,
                          size: 60,
                          color: Color(0xFFA7CD3A),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Insurance Policy Active",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nPhilip & Cater Insurance PLC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA7CD3A),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            "\nInsurance type: Vehicle Insurance",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: "Poppins-Regular",
                                        )),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, right: 25, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "REVIEW",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SEND MEMO",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
