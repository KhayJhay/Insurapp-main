import 'package:flutter/material.dart';
import 'package:insurapp/Home/start_claim.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:insurapp/providers/notify_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Widgets/appBarHead.dart';
import '../providers/theme_provider.dart';

class Claims_Page extends StatefulWidget {
  @override
  State<Claims_Page> createState() => _Claims_PageState();
}

class _Claims_PageState extends State<Claims_Page> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final welcome_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE3E7E8);
    final bodytext_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Color(0xFF303F46);
    return HeaderAppBar(
      child: SafeArea(
        child: SingleChildScrollView(
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
                    "Claims",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Medium",
                      color: bodytext_color,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Lottie.asset("assets/lotties/empty.json")),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "You have not made any claims yet. Click on the link below to make a new claim now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins-Light",
                            color: bodytext_color,
                          ),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartClaim()));
                      },
                      child: Text(
                        "Make A Claim",
                        style: TextStyle(
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
      ),
    );
  }
}
