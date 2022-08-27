import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Authentication/law_enf_sign_in.dart';
import 'package:insurapp/Authentication/login&register_page.dart';

class Get_Started extends StatelessWidget {
  const Get_Started({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: _height <= 700 ? 635 : _height,
                width: _width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/getstarted.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: _height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      stops: [0.1, 0.8],
                      colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: _height <= 700 ? 20 : 70),
                        child: Center(
                          child: Image.asset(
                            "assets/pngs/logobg2.png",
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: _height <= 700 ? 20 : 10.0),
                        child: Column(
                          children: [
                            Text(
                              "Mobile Insurance \nSolution",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Poppins-ExtraBold",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: _height <= 700 ? 10 : 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: Text(
                                "Bringing to you real-time \ninsurance solution at your finger \ntips",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins-Light",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _height <= 700 ? 15 : 80,
                            ),
                            GestureDetector(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.QUESTION,
                                  animType: AnimType.SCALE,
                                  title: 'Sign Up',
                                  desc: 'Are you a Law enforcer or a Motorist?',
                                  btnCancelText: "Law Enforcer",
                                  btnOkText: "Motorist",
                                  btnCancelOnPress: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Law_Enf_Login_Page()),
                                    );
                                  },
                                  btnOkOnPress: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Login_Register_Page()),
                                    );
                                  },
                                )..show();
                              },
                              child: Container(
                                width: 300,
                                height: _height <= 700 ? 50 : 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [
                                      Color(0xFF44A8E0),
                                      Color(0xFFA7CD3A),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: Text(
                                  "GET STARTED",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "Poppins-Light"),
                                )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
