import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/dead_battery.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/engine_heat_tips.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/engine_oil_tips.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/flat_tire.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/low_fuel.dart';
import 'package:insurapp/Sub-menu/help&support/road_assistance/towing_tips.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/theme_provider.dart';

class Road_Assistance_Page extends StatelessWidget {
  const Road_Assistance_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Colors.white;
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Colors.white;
    final welcome_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE3E7E8);
    final bodytext_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Color(0xFF303F46);
    final Uri _urlaaa = Uri.parse('https://roadside.aaa.com/');
    final Uri _urlrapid = Uri.parse('https://www.rapidroadsideassistance.com/');
    final Uri _urlchicago = Uri.parse('https://chicagoiltowingservice.com/');
    final Uri _urlnearme = Uri.parse(
        'https://www.google.com/maps/search/towing+services+near+me/');

    Future<void> _launchAAAUrl() async {
      if (!await launchUrl(_urlaaa)) {
        throw 'Could not launch $_urlaaa';
      }
    }

    Future<void> _launchRAPUrl() async {
      if (!await launchUrl(_urlrapid)) {
        throw 'Could not launch $_urlrapid';
      }
    }

    Future<void> _launchCHICUrl() async {
      if (!await launchUrl(_urlchicago)) {
        throw 'Could not launch $_urlchicago';
      }
    }

    Future<void> _launchNEARUrl() async {
      if (!await launchUrl(_urlnearme)) {
        throw 'Could not launch $_urlnearme';
      }
    }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: welcome_color,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
              ),
              child: Center(
                child: Text(
                  "Roadside Assistance",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins-Medium",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Quick Roadside Assistance Solution",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontFamily: 'Poppins-Regular'),
                    ),
                    Text(
                      "Get A Rapid Roadside Assistance Solution To Your Problems with Urgency Via The Links Below",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10, fontFamily: 'Poppins-Regular'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
              child: Column(children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 120,
                    child: ListTile(
                      onTap: () {
                        _launchAAAUrl();
                      },
                      title: Text(
                        "AAA Roadside Assistance",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Poppins-SemiBold",
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "Stay updated with all information relating to insurance as well as keeping your "
                        "insurance status updated. ",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Light",
                        ),
                      ),
                      leading: Image.asset("assets/pngs/aaa.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 120,
                    child: ListTile(
                      onTap: () {
                        _launchRAPUrl();
                      },
                      title: Text(
                        "Rapid Roadside Assistance",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Poppins-SemiBold",
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "View, request and print your ID cards when you need them right from the convenience of your phone.  ",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Light",
                        ),
                      ),
                      leading: Image.asset(
                        "assets/pngs/rapid.png",
                        width: 90,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 120,
                    child: ListTile(
                      onTap: () {
                        _launchCHICUrl();
                      },
                      title: Text(
                        "Chicago IL Road Assistance",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Poppins-SemiBold",
                          color: Colors.green,
                        ),
                      ),
                      subtitle: Text(
                        "This is a roadside and towing service in chicago that ensures safe and damage free loading and transporting of vehicles",
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins-Light",
                        ),
                      ),
                      leading: Image.asset("assets/pngs/chic.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    _launchNEARUrl();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    height: _height * 0.075,
                    width: _width - 78,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF44A8E0),
                            Color(0xFFA7CD3A),
                          ],
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5),
                        ]),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: FaIcon(FontAwesomeIcons.locationArrow,
                              size: 25, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Towing Services Nearme",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Poppins-Medium',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
