import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Insurapp extends StatelessWidget {
  const About_Insurapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFECEFF0),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Insurapp",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-Bold',
                      color: Color(0xFF303F46),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:"        "
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
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFFEFF3F4),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: Center(
                  child: Text("BACK",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontFamily: "Poppins-SemiBold",
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
