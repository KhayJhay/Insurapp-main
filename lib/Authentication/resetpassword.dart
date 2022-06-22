import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Authentication/userCredential.dart';

import '../Widgets/authWedget.dart';
import 'login&register_page.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({Key? key}) : super(key: key);

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  final keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  final emailController = TextEditingController();

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
          child: CircularProgressIndicator(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
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
                    "assets/images/bg.webp",
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
                          text: "Enter your ",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins-Light',
                            letterSpacing: 2,
                          ),
                          children: [
                            TextSpan(
                              text: " Email,",
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
                      "To recieve a mail",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Light',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: 350,
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
                  Text(
                    "Reset Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Light',
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  buildLoginSection(),
                ],
              ),
            ),
          ),
          //submit button
          buildSubmitBottomContainer(true)
        ],
      )),
    );
  }

  //Card
  Container buildLoginSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: keyForm,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(
                  emailController, CupertinoIcons.mail, "Email", false, true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => Login_Register_Page()),
                      );
                    },
                    child: Text(
                      '< Back To Login Page',
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

  //Authentication Button
  Positioned buildSubmitBottomContainer(bool showShadow) {
    return Positioned(
        top: 460,
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
                            setState(() {
                              isLoading = true;
                            });
                            if (keyForm.currentState!.validate()) {
                              Auth.resetPassword(context, emailController.text);

                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Mail Sent!',
                                desc: 'A reset email has been sent to you',
                                btnOkOnPress: () {
                                  Navigator.of(context).pop();
                                },
                              )..show();
                              Navigator.of(context).pop();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.WARNING,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Invalid Form',
                                desc: 'Enter a valid email',
                                btnOkOnPress: () {},
                              )..show();
                            }
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
