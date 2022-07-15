import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class About_Insurapp extends StatelessWidget {
  const About_Insurapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar_color,
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 100,
                  child: Image.asset("assets/pngs/logobg1c.png", fit: BoxFit.contain,),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 450,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:"     "
                                "Who We Service",
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Bold",
                            ),
                          ),
                          TextSpan(
                            text:"\n\nWith Insurapp, you get the best of both worlds"
                                "\n\n Insurapp is a smart cutting edge insurance tracker that"
                                "provides users with 24/7 access to qualify insurance. It also"
                                "serves as a simple, no cost protection to save motorists from "
                                "accepting policies that reference valid insurance but has since "
                                "lapsed in the prior months."
                                "\n\n With no prior-contract needed to login, and a price tag that's"
                                "incredibly low, insurapp is hands down the best bet for knowing everything"
                                "you want about insurance."
                                "\n\n Set for this beautiful ride? You've come to the right place,"
                                "check out the market that this app is designed to serve",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontFamily: "Poppins-Medium",
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0,),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: welcome_color,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,width: 0.5)
                  ),
                  child: Center(
                    child: Text("BACK",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontFamily: "Poppins-SemiBold",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
