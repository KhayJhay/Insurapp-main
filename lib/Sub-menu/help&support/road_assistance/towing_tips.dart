import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../providers/theme_provider.dart';


class TowingTips extends StatefulWidget {
  const TowingTips({Key? key}) : super(key: key);

  @override
  State<TowingTips> createState() => _TowingTipsState();
}

class _TowingTipsState extends State<TowingTips> {
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
                child: Text("Getting Your Car Towed Tips",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 120,
                      child: ListTile(
                        title: Text("Remove Necessary Items ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("The first thing you need to do is gather all personal items and remove them from your vehicle. This ensures nothing goes missing or get’s damaged during transport. ",
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
                        title: Text("Take Pictures of Your Vehicle ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("Before the tow truck arrives, go ahead and take pictures of your vehicle with your phone.  ", style: TextStyle(
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
                        title: Text("Disengage Your Emergency Brake ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("Your emergency brake will need to be disengaged when your vehicle gets loaded onto the truck. If it isn’t, damage can result.  ", style: TextStyle(
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
                        title: Text("Close All Windows",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-SemiBold",
                          ),),
                        subtitle:  Text("This may seem like an insignificant step, but closing all your windows is essential.", style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
