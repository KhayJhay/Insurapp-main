import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Contact_Us extends StatefulWidget {
  const Contact_Us({Key? key}) : super(key: key);

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
            color: Colors.white,
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
                    color: Color(0xFF44A8E0),
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
                              height: 70,
                              width: 70,
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
                                        fontSize: 16,
                                        color:Colors.white,
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nSan Diego, CA",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text:"\n234 Django ST",
                                      style: TextStyle(
                                        fontSize: 16,
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
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF44A8E0),
                                  border: Border.all(color: Colors.white,width: 1)
                              ),
                              child:  Icon(CupertinoIcons.phone_circle_fill, size: 40,color: Colors.white,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text:"PHONE",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:Colors.white,
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n(+75) 352 3236",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text:"\n(+75) 352 2266",
                                      style: TextStyle(
                                        fontSize: 16,
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
                              height: 70,
                              width: 70,
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
                                        fontSize: 16,
                                        color:Colors.white,
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nInsurap@gm...",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text:"\nInsur23@gm...",
                                      style: TextStyle(
                                        fontSize: 16,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Message Us",style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF303F46),
                        fontFamily: "Poppins-Bold"
                    ),),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text("Name",style: TextStyle(
                           fontSize: 18,
                           color: Color(0xFF303F46),
                           fontFamily: "Poppins-Medium"
                       ),),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 20),
                         height: 45,
                         width: 250,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                                 color: Colors.black.withOpacity(0.1),
                                 blurRadius: 6,
                                 spreadRadius: 1),
                           ],
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child: Row(
                           children: [
                             SizedBox(
                               width: 15,
                             ),
                             Expanded(
                               child: TextField(
                                 onChanged: (value) {},
                                 decoration: InputDecoration(
                                   hintText: "Enter Your Name",
                                   hintStyle: TextStyle(
                                     color: Colors.black.withOpacity(0.5),
                                     fontSize: 16,
                                   ),
                                   enabledBorder: InputBorder.none,
                                   focusedBorder: InputBorder.none,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Email",style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF303F46),
                            fontFamily: "Poppins-Medium"
                        ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  spreadRadius: 1),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "Enter email",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Address",style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF303F46),
                            fontFamily: "Poppins-Medium"
                        ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  spreadRadius: 1),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    hintText: "Enter your address",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,top: 25),
                    child: Row(
                      children: [
                        Text("Message",style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF303F46),
                            fontFamily: "Poppins-Medium"
                        ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 100,
                          width: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  spreadRadius: 1),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
