import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:insurapp/OnBording/introduction_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),(){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IntroductionScreen()));
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                child: Image.asset("assets/pngs/logobg2.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CircularProgressIndicator(
                color:  Color(0xFFA7CD3A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
