import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
class Contact_Us extends StatefulWidget {
  const Contact_Us({Key? key}) : super(key: key);

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade600 : Color(0xFF44A8E0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: <Widget>[
                Container(
                  height: _height*0.35,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0, left: 10, bottom: 15,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: _height*0.08,
                              width: _width*0.18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF44A8E0),
                                border: Border.all(color: Colors.white,width: 1)
                              ),
                              child:  Icon(CupertinoIcons.location_solid, size: 40,color: Colors.white,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:"ADDRESS",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:Colors.white,
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nSan Diego, CA",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text:"\n234 Django ST",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: _height*0.08,
                              width: _width*0.18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF44A8E0),
                                  border: Border.all(color: Colors.white,width: 1)
                              ),
                              child:  Icon(CupertinoIcons.phone_circle_fill, size: 40,color: Colors.white,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"PHONE",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:Colors.white,
                                          fontFamily: "Poppins-Bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\n(+75) 352 3236",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: "Poppins-Light",
                                        ),
                                      ),
                                      TextSpan(
                                        text:"\n(+75) 352 2266",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: "Poppins-Light",
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: _height*0.08,
                              width: _width*0.18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF44A8E0),
                                  border: Border.all(color: Colors.white,width: 1)
                              ),
                              child:  Icon(CupertinoIcons.mail_solid, size: 40,color: Colors.white,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:"EMAIL",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:Colors.white,
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nInsurap@gm...",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text:"\nInsur23@gm...",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),),
          Padding(
            padding: const EdgeInsets.only(top: 350, left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Message Us",style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Poppins-Bold"
                    ),),
                  ),
                SizedBox(
                height: 35,
              ),
                  buildTextField("Full Name", " ", false),
                  buildTextField("E-mail", " ", false),
                  buildTextField("Tel", " ", false),
                  buildTextField("Address", " ", false),
                  buildTextField("Message", " ", false),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 20,),
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFEFF3F4),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey,width: 0.5)
                      ),
                      child: Center(
                        child: Text("SEND",
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
          )
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
