import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/dead_battery.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/engine_heat_tips.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/flat_tire.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/low_fuel.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/towing_tips.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class Road_Assistance_Page extends StatelessWidget {
  const Road_Assistance_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Colors.white;
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: appbar_color,
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
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell_solid, color: Colors.grey,size: 26,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: welcome_color,
                border: Border(bottom: BorderSide(color: Colors.black12,)),
              ),
              child: Center(
                child: Text("Road Assistance",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 30, right: 30),
              child: Text("How may we assist you?",style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins-SemiBold',
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 30, right: 30),
              child: Text("Select the challenge you're facing from the menu below",style: TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins-Light',
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      sliver: SliverGrid.count(
                        crossAxisCount:2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 13,
                        childAspectRatio: 1.1,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h1.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Low Fuel",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LowFuelTips()));
                            },
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Flat_Tire_Tips()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h2.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Flat Tire",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TowingTips()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h3.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Towing",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DeadBatteryTips()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h5.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Dead Battery",style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EngineHeatTips()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h7.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Engine Heat",style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EngineHeatTips()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 3),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/h6.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Engine Oil",style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
