import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/OnBording/introduction_page.dart';
import 'package:lottie/lottie.dart';

class InsurappBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        LottieBuilder.asset(
          'assets/lotties/bglott.json',
          height: _height,
          width: _width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image.asset("assets/pngs/logobg2.png"),
              ),
              const Spacer(flex: 1),
              Material(
                type: MaterialType.transparency,
                child: Text(
                  'Mobile Insurance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "Poppins-ExtraBold",
                    letterSpacing: 1,
                  ),
                  maxLines: 1,
                ),
              ),
              const Spacer(flex: 1),
              Material(
                type: MaterialType.transparency,
                child: Text(
                  'Bringing to you real-time insurance solution at your finger tips',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins-Light'),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const Spacer(flex: 3),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntroductionScreen()));
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.chevron_right_2,
                        size: 30,
                        color: Color(0xFF143A8A),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
