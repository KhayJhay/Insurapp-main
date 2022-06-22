import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
class Discover_Page extends StatefulWidget {
  const Discover_Page({Key? key}) : super(key: key);

  @override
  State<Discover_Page> createState() => _Discover_PageState();
}

class _Discover_PageState extends State<Discover_Page> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: <Widget>[
                Container(
                  height: _height*0.35,
                  decoration: BoxDecoration(
                    color: Color(0xFF44A8E0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 10, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: _width),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("Discover \nOur Blog",
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontFamily: "Poppins-ExtraBold"
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10,right: 340),
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Text("Discover latest tips, ideas and info",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "Poppins-Medium"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),),
          Positioned(
            top: 270,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search Activities",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 20,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 65,
                    decoration: BoxDecoration(
                      color:  Color(0xFFA7CD3A),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                    ),
                    child: Icon(CupertinoIcons.search, color: Colors.white, size: 26,),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 355, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("People Near You",style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF303F46),
                        fontFamily: "Poppins-Bold"
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                        height: 200,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: _width/2.8,
                                margin: EdgeInsets.only(right: 16, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE8F3F3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/images/roadside.jpg",
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "RoadSide\nAssistance",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: ResponsiveValue(context, defaultValue: 14.0, valueWhen: [
                                                    Condition.smallerThan(name: MOBILE, value: 12.0),
                                                    Condition.largerThan(name: MOBILE, value: 18.0),
                                                  ]).value,
                                                  fontFamily: 'Poppins-SemiBold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: Container(
                                width: _width/2.8,
                                margin: EdgeInsets.only(right: 16, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE8F3F3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/images/virtual.jpg",
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Virtual\nAssistance",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins-SemiBold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: Container(
                                width: _width/2.8,
                                margin: EdgeInsets.only(right: 16, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE8F3F3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/images/digital.jpg",
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Digital\nID",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins-SemiBold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            InkWell(
                              child: Container(
                                width: _width/2.8,
                                margin: EdgeInsets.only(right: 16, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Color(0xFFE8F3F3),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            "assets/pngs/logobg2.png",
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Why You Should\nChoose Us",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins-SemiBold'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Recent Feeds",style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF303F46),
                        fontFamily: "Poppins-Bold"
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:25),
                    child: Container(
                      height: 300,
                      width: _width,
                      decoration: BoxDecoration(
                        color: Color(0xFF303F46),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/accid.jpg",),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.5, 0.9],
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(.6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 180,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Accidents",
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontFamily: "Poppins-ExtraBold"
                                ),
                              ),
                              Text("Moderate Intensity",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Light"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:25),
                    child: Container(
                      height: 300,
                      width: _width,
                      decoration: BoxDecoration(
                        color: Color(0xFF303F46),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/roadside.jpg",),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.5, 0.9],
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(.6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 180,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Car Break Down",
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontFamily: "Poppins-ExtraBold"
                                ),
                              ),
                              Text("High Intensity",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Light"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:25),
                    child: Container(
                      height: 300,
                      width: _width,
                      decoration: BoxDecoration(
                        color: Color(0xFF303F46),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/claims.jpg",),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.5, 0.9],
                            colors: [
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(.6),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 180,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Claims",
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontFamily: "Poppins-ExtraBold"
                                ),
                              ),
                              Text("Moderate Intensity",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Light"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
