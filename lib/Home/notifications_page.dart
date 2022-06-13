import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/settings_page.dart';
import 'package:lottie/lottie.dart';
class Notifications_Page extends StatelessWidget {
  static String id = 'notifications_page';
  const Notifications_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                color: Color(0xFFE3E7E8),
                border: Border(bottom: BorderSide(color: Colors.black12,)),
              ),
              child: Center(
                child: Text("Reminders",style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins-Medium",
                  color: Color(0xFF303F46),
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset("assets/lotties/notif.json")
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text("No notifications recieved, make sure notifications are turned on. Click on the link below to check your settings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Light",
                      color: Color(0xFF303F46),
                    ),)
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Settings_Screen.id);
                        },
                      child: Text("Check Settings", style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins-SemiBold",
                        color: Colors.blue,
                      ),
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
