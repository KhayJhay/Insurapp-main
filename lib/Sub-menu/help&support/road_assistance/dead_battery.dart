import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../providers/theme_provider.dart';

class DeadBatteryTips extends StatelessWidget {
  const DeadBatteryTips({Key? key}) : super(key: key);

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
                child: Text("Dead Car Battery Tips",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 25.0),
             child: Column(
               children: [
                 Card(
                   child: Container(
                     padding: EdgeInsets.all(8),
                     height: 120,
                     child: ListTile(
                       title: Text("Tap the Battery Terminals",
                         style: TextStyle(
                           fontSize: 16,
                           fontFamily: "Poppins-SemiBold",
                         ),),
                       subtitle:  Text("While you can’t clean the battery terminals if you’re stuck without the right tools, you can try tapping them. Jarring the terminal’s positions might help give the battery a better connection.",
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
                       title: Text("Try Starting the Car in Neutral",
                         style: TextStyle(
                           fontSize: 16,
                           fontFamily: "Poppins-SemiBold",
                         ),),
                       subtitle:  Text("Moving the shifter can sometimes help establish electrical contact inside the neutral safety switch. This is also sometimes referred to as the transmission range selector. ", style: TextStyle(
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
                       title: Text("Trick the Computer",
                         style: TextStyle(
                           fontSize: 16,
                           fontFamily: "Poppins-SemiBold",
                         ),),
                       subtitle:  Text("Certain situations can cause the air to fuel mixture to be too lean for a cold engine. Common scenarios that might cause this include a bad temperature sensor or a vacuum leak. ", style: TextStyle(
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
                       title: Text("Use Jumper Cables",
                         style: TextStyle(
                           fontSize: 16,
                           fontFamily: "Poppins-SemiBold",
                         ),),
                       subtitle:  Text("It’s recommended everyone keeps a set of jumper cables in their car. ", style: TextStyle(
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
