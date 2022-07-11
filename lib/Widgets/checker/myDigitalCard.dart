import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Home/checkerpage/digitalForm.dart';
import '../../Home/checkerpage/policy_details.dart';
import '../../Models/insura_.model.dart';

class My_Digital_ID extends StatefulWidget {
  const My_Digital_ID({Key? key}) : super(key: key);

  @override
  State<My_Digital_ID> createState() => _My_Digital_IDState();
}

class _My_Digital_IDState extends State<My_Digital_ID> {
  bool isFalse = false;
  bool isActive = true;
  late DigitalIDModel _digiatal;
  late InsuraCardModel _digitalIDModel;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final collectionReference =
        FirebaseFirestore.instance.collection('insuracard');
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('digitalCard')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Digital ID added yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Light",
                      color: Color(0xFF303F46),
                    ),
                  ),
                  Text(
                    'Press the button bellow to add yours',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Light",
                      color: Color(0xFF303F46),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DigitalForm()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 165,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF44A8E0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF44A8E0),
                                blurRadius: 4,
                                spreadRadius: 1),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Digital ID",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins-SemiBold',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            _digiatal =
                DigitalIDModel.fromJson(snapshot.data!.docs.first.data());
            return StreamBuilder(
              stream: collectionReference.doc(_digiatal.policyCard).snapshots(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      policysnapshot) {
                if (policysnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitSpinningLines(
                      color: Colors.lightGreen,
                    ),
                  );
                }
                if (policysnapshot.hasError) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Digital ID added yet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-Light",
                            color: Color(0xFF303F46),
                          ),
                        ),
                        Text(
                          'Press the button bellow to add yours',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins-Light",
                            color: Color(0xFF303F46),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DigitalForm()),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 165,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFF44A8E0),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF44A8E0),
                                      blurRadius: 4,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Add Digital ID",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins-SemiBold',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (policysnapshot.hasData) {
                  _digitalIDModel = InsuraCardModel.fromJson(
                      policysnapshot.data!.data() as Map<String, dynamic>);

                  print(policysnapshot.data!.data());
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          image: MemoryImage(base64.decode(
                                            '${_digiatal.profile}',
                                          )),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${_digitalIDModel.insured}",
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
                                                  text:
                                                      "\n${_digitalIDModel.company}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF303F46),
                                                    fontFamily: "Poppins-Bold",
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "\nID: ${_digitalIDModel.policyNumber}",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontFamily:
                                                        "Poppins-Regular",
                                                  ),
                                                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                padding: const EdgeInsets.only(
                                    top: 15.0, right: 25, left: 25),
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
                          ),
                        ),
                      ),
                      //title
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
                      //card
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                            width: _width,
                            height: _height <= 700 ? 185 : 200,
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
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        width: 200,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.ellipsis,
                                        color: Color(0xFF303F46),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        isActive
                                            ? CupertinoIcons.check_mark_circled
                                            : CupertinoIcons.multiply_circle,
                                        size: _height <= 700 ? 50 : 60,
                                        color: isActive
                                            ? Color(0xFFA7CD3A)
                                            : Colors.red,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: isActive
                                                          ? "Insurance Policy Active"
                                                          : "Insurance Policy Inactive",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: isActive
                                                            ? Color(0xFFA7CD3A)
                                                            : Colors.red,
                                                        fontFamily:
                                                            "Poppins-Bold",
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "\n${_digitalIDModel.company}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: isActive
                                                            ? Color(0xFF303F46)
                                                            : Colors.red,
                                                        fontFamily:
                                                            "Poppins-Bold",
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            "\n${_digitalIDModel.model}",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              "Poppins-Regular",
                                                        )),
                                                  ],
                                                ),
                                                textAlign: TextAlign.start,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _height <= 700 ? 9 : 12.0),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 0.3,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _height <= 700 ? 13 : 15.0,
                                      right: 25,
                                      left: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => PolicyDetails(
                                                  cardModel: _digitalIDModel,
                                                  isActive: isActive),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "REVIEW",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            letterSpacing: 2,
                                            fontFamily: "Poppins-SemiBold",
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "SEND MEMO",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            letterSpacing: 2,
                                            fontFamily: "Poppins-SemiBold",
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "SHARE",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            letterSpacing: 2,
                                            fontFamily: "Poppins-SemiBold",
                                          ),
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
                return Center(
                  child: SpinKitSpinningLines(
                    color: Colors.lightGreen,
                  ),
                );
              },
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitSpinningLines(
                color: Colors.lightGreen,
              ),
            );
          }
          return Center(
            child: SpinKitSpinningLines(
              color: Colors.lightGreen,
            ),
          );
        });
  }
}

          

// : Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'No Digital ID added yet',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: "Poppins-Light",
//                       color: Color(0xFF303F46),
//                     ),
//                   ),
//                   Text(
//                     'Press the button bellow to add yours',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: "Poppins-Light",
//                       color: Color(0xFF303F46),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => DigitalForm()),
//                         );
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 165,
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: Color(0xFF44A8E0),
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Color(0xFF44A8E0),
//                                 blurRadius: 4,
//                                 spreadRadius: 1),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Add Digital ID",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontFamily: 'Poppins-SemiBold',
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
          