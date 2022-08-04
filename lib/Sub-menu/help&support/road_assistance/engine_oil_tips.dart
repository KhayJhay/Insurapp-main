import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../providers/theme_provider.dart';
class Engine_Oil_Tips extends StatelessWidget {
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
                child: Text("Tips to Change Engine Oil",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Jack It Up, Open It Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("First, you'll want to lift the car high enough to give yourself room to work under it. Whether you use a hoist, ramps, or jack stands, make sure you are being absolutely safe.",
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
                        title: Text("Unplug It, Drain It",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("Situate your oil receptacle—five-gallon bucket, oil drain pan (available at an auto-parts store), oil reservoir, or any other sizable liquid-holding container—in such a way that the oil will drain into it ", style: TextStyle(
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
                        title: Text("Off With the Old Filter",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("Find the oil filter. It's the softball-sized cylindrical component screwed onto the engine (though some engines have a housing that you slip a filter cartridge into).  ", style: TextStyle(
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
                        title: Text("Drain Plug in, Filter On",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("Replace the drain plug and tighten it until it's snug, but not too much: Overtightening can cause damage to the oil pan and drain plug. ", style: TextStyle(
                          fontSize: 10,
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
            ),
          ],
        ),
      ),
    );
  }
}
