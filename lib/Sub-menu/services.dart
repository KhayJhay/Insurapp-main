import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/checkerpage/checker_page.dart';
import 'package:insurapp/Sub-menu/settings_page.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'help&support/Road Assistance.dart';
class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE8F3F3);
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbar_color,
        toolbarHeight: 75,
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
                child: Text("Services",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 20),
              child: Column(
                  children:[
                    Card(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 120,
                        child: ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, Settings_Screen.id);
                          },
                          title: Text("Get Insurance Updates",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text("Stay updated with all information relating to insurance as well as keeping your "
                              "insurance status updated. ", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/update.png"),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Checker_Page()));
                          },
                          title: Text("Digital ID Cards",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text("View, request and print your ID cards when you need them right from the convenience of your phone.  ", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/digital.png"),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Checker_Page()));
                          },
                          title: Text("Link D-Licence to PL",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text("With Insurapp you can link your drivers licence number to your Insurance Policy Number ", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/dl.png"),
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
                            Navigator.pushNamed(context, Settings_Screen.id);
                          },
                          title: Text("Virtual Assistance",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text("With the virtual assistant's 24/7 availability, you can be assured of getting the needed assistance anytime.  ", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/va.png"),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Road_Assistance_Page()));
                          },
                          title: Text("RoadSide Assistance",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text("Apart from insurance services, our app offers you all the road assistance you need to keep going on a trip.  ", style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/tow.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
