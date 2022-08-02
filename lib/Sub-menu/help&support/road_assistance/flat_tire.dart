import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Home/start_claim.dart';
import '../../../providers/theme_provider.dart';
class Flat_Tire_Tips extends StatelessWidget {
  const Flat_Tire_Tips({Key? key}) : super(key: key);

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
                child: Text("Flat Tire Safety Tips",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Be Prepared",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("The first step should happen before a flat tire even happens. "
                            "Keep the necessary tools in your car to prepare for a potential flat tire",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins-Light",
                          ),),
                        leading:  Image.asset("assets/pngs/1-circle-c.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Pull Over To a Safe Place",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("A flat tire can happen at any moment while traveling on the road. If you notice that your tire is flat, pull over to a safe position on the road. ", style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Light",
                        ),),
                        leading:  Image.asset("assets/pngs/2-circle.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Turn on Your Hazard Lights",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("After you find a safe area on the side of the road, turn on your hazard lights. This communicates to other drivers on the road that you’re going to remain in that area for a while.  ", style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Light",
                        ),),
                        leading:  Image.asset("assets/pngs/3-circle.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Apply the Parking Brake",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("When you’ve parked at a safe location, make sure you’re on flat, level ground, and apply the parking brake once your vehicle comes to a stop.", style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins-Light",
                        ),),
                        leading:  Image.asset("assets/pngs/4-circle.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StartClaim()));
                        },
                        title: Text("For Further Assistance",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("For further helpful assistance make a claim by clicking here  ", style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins-Light",
                        ),),
                        leading:  Image.asset("assets/pngs/5-circle-c.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
