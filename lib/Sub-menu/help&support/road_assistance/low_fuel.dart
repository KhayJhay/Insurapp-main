import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../providers/theme_provider.dart';


class LowFuelTips extends StatefulWidget {
  const LowFuelTips({Key? key}) : super(key: key);

  @override
  State<LowFuelTips> createState() => _LowFuelTipsState();
}

class _LowFuelTipsState extends State<LowFuelTips> {
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
                child: Text("Low Fuel Tips",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(8),
                height: 120,
                child: ListTile(
                  title: Text("Keep your cool",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-SemiBold",
                    ),),
                  subtitle:  Text("There is no point getting all worked up when you see the low fuel warning light"
                      " on the speedometer console. Most modern day cars will still have about "
                      "5 liters of usable fuel left in the petrol tank. ",
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
                  title: Text("Search for the nearest fuel station",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-SemiBold",
                    ),),
                  subtitle:  Text("Make use of Google Maps application on your mobile phone to locate the nearest fuel pump.  ", style: TextStyle(
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
                  title: Text("Limit fuel consuming devices usage.",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-SemiBold",
                    ),),
                  subtitle:  Text("Units such as air-conditioning unit puts a heavy load on the engine of a small car.  ", style: TextStyle(
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
                  title: Text("Reduce acceleration drastically",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-SemiBold",
                    ),),
                  subtitle:  Text("Save fuel by accelerating gently and changing gears at the right engine speed.  ", style: TextStyle(
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
      ),
    );
  }
}
