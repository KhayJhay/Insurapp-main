import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurapp/Authentication/resetpassword.dart';
import 'package:insurapp/Authentication/userCredential.dart';
import 'package:insurapp/Authentication/verify_law_enforcer.dart';
import 'package:insurapp/Widgets/authWedget.dart';

class Law_Enf_Login_Page extends StatefulWidget {
  @override
  State<Law_Enf_Login_Page> createState() => _Law_Enf_Login_PageState();
}

class _Law_Enf_Login_PageState extends State<Law_Enf_Login_Page> {
  final keyForm = GlobalKey<FormState>();

  bool isSignupScreen = true;
  bool isRememberme = false;
  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final mobileController = TextEditingController();

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/law1.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topRight,
                    stops: [0.1, 0.8],
                    colors: [
                      Color(0xFF44A8E0).withOpacity(.8),
                      Color(0xFFA7CD3A).withOpacity(.4),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: isSignupScreen ? "Welcome to" : "Welcome",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins-Light',
                            letterSpacing: 2,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " Insurapp," : " Back,",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-Light',
                                  letterSpacing: 3),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup As a Law-Enforcer"
                          : "Signin As a Law-Enforcer",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Bold',
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildSubmitBottomContainer(true),
          Positioned(
              top: 200,
              child: Container(
                height: isSignupScreen ? 480 : 380,
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-Light',
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Color(0xFF44A8E0)
                                        : Colors.grey),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFFA7CD3A),
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins-Light',
                                    color: isSignupScreen
                                        ? Color(0xFF44A8E0)
                                        : Colors.grey),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color(0xFFA7CD3A),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (!isSignupScreen)
                      SizedBox(
                        height: 25,
                      ),
                    if (isSignupScreen)
                      SizedBox(
                        height: 15,
                      ),
                    if (isSignupScreen) buildSIgnUpSection(),
                    if (!isSignupScreen) buildLoginSection(),
                  ],
                ),
              )),
          //third party authentications
          buildSubmitBottomContainer(false),
          if (!isSignupScreen)
            Positioned(
                top: 650,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //google authentication
                      GestureDetector(
                        onTap: () {
                          Auth.signinWithGoogle(context: context);
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
                              borderRadius: BorderRadius.circular(40),
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
                                child: FaIcon(FontAwesomeIcons.google,
                                    size: 25, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  "Continue With Google",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Poppins-Light',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }

  // loading button
  Container loading() {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF44A8E0),
                Color(0xFFA7CD3A),
              ],
            )),
        child: Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 30,
          ),
        ));
  }

  // login section
  Container buildLoginSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: keyForm,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(emailController, CupertinoIcons.mail,
                  "Enter Force ID", false, true),
              buildTextField(passController, CupertinoIcons.lock_circle,
                  "Enter Password", true, false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isRememberme,
                          onChanged: (value) {
                            setState(() {
                              isRememberme = !isRememberme;
                            });
                          }),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ForgottenPassword()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // sign-up section
  Container buildSIgnUpSection() {
    return Container(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            buildTextField(
              nameController,
              CupertinoIcons.person,
              "User Name",
              false,
              false,
            ),
            buildTextField(
              emailController,
              CupertinoIcons.mail,
              "email",
              false,
              true,
            ),
            buildTextField(
              passController,
              CupertinoIcons.lock_circle,
              "password",
              true,
              false,
            ),
            buildTextField(
              mobileController,
              CupertinoIcons.phone,
              "mobile number",
              false,
              false,
            ),
            RichText(
              text: TextSpan(
                  text: "by pressing 'Submit' you agree to our ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: "terms & conditions",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto Thin',
                          color: Colors.deepOrangeAccent),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  //Authentication Button
  Positioned buildSubmitBottomContainer(bool showShadow) {
    return Positioned(
        top: isSignupScreen ? 630 : 550,
        right: 0,
        left: 0,
        child: Center(
          child: isLoading
              ? loading()
              : Container(
                  height: 80,
                  width: 190,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        if (showShadow)
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1.5,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                      ]),
                  child: !showShadow
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Verfify_Law_Enf_Page()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF44A8E0),
                                    Color(0xFFA7CD3A),
                                  ],
                                )),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(),
                ),
        ));
  }
}
