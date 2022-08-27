import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurapp/OnBording/insurappbg.dart';
import 'dart:async';
import 'package:insurapp/OnBording/introduction_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InsurappBackground()));
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
                width: 350,
                child: Image.asset(
                  "assets/pngs/logobg2.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SpinKitSpinningLines(
                color: Colors.lightGreen,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
