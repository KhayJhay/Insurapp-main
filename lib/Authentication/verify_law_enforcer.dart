import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurapp/Law_Enf_Home/law_home.dart';
import 'package:insurapp/Law_Enf_Home/law_mainpage.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verfify_Law_Enf_Page extends StatefulWidget {
  const Verfify_Law_Enf_Page({Key? key}) : super(key: key);

  @override
  State<Verfify_Law_Enf_Page> createState() => _Verfify_Law_Enf_PageState();
}

class _Verfify_Law_Enf_PageState extends State<Verfify_Law_Enf_Page> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
        child: Column(
          children: [
            Lottie.asset(
              "assets/lotties/ver2.json",
              height: 350,
            ),
            Center(
              child: Text(
                "To verify that you are a Law Enforcer, Please enter Your Force ID and Submit",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  inactiveColor: Colors.grey,
                  activeFillColor: Colors.greenAccent),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 20, height: 1.6),
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                print("Completed");
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              onChanged: (String value) {},
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Law_Main_Page()));
              },
              child: Container(
                height: 60,
                width: 200,
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
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ]),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    "Verify ID",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins-Light',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
