import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class My_Digital_ID extends StatelessWidget {
  const My_Digital_ID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "Digital ID & Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: _width,
              height: _height <= 700 ? 370 : 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.ellipsis,
                          color: Color(0xFF303F46),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/profile.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Koya Brown",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  "
                                          "Verified",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF1D95DA),
                                        fontFamily: "Poppins-Light",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nAutomotive Policy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\nCurrent rate of \$56.23/month",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: "Poppins-Regular",
                                        )),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _height <= 700 ? 20 : 30.0,
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 90,
                            child: Image.asset(
                              "assets/pngs/benlog.png",
                            )),
                        Image.asset(
                          "assets/pngs/benz2.png",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, right: 25, left: 25),
                    child: Center(
                      child: Text(
                        "VIEW FULL ID",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          letterSpacing: 2,
                          fontFamily: "Poppins-SemiBold",
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "ID Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: _width,
              height: _height <= 700 ? 180 : 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.ellipsis,
                          color: Color(0xFF303F46),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.check_mark_circled,
                          size: _height <= 700 ? 50 : 60,
                          color: Color(0xFFA7CD3A),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Insurance Policy Active",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF303F46),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\nPhilip & Cater Insurance PLC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFA7CD3A),
                                        fontFamily: "Poppins-Bold",
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            "\nInsurance type: Vehicle Insurance",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontFamily: "Poppins-Regular",
                                        )),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // -- Divider
                  Padding(
                    padding: EdgeInsets.only(top: _height <= 700 ? 10 : 12.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  // -- sub buttons
                  Padding(
                    padding: EdgeInsets.only(
                        top: _height <= 700 ? 13 : 15.0, right: 25, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "REVIEW",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SEND MEMO",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 2,
                            fontFamily: "Poppins-SemiBold",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
