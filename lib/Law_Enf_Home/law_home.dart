import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../Models/insura_.model.dart';
import '../Home/checkerpage/policy_details.dart';
import '../data_service/insura_data.dart';
import '../providers/theme_provider.dart';

class LawEnforcer extends StatefulWidget {
  @override
  State<LawEnforcer> createState() => _LawEnforcerState();
}

class _LawEnforcerState extends State<LawEnforcer> {
  final idNumberController = TextEditingController();
  InsuraCardModel cardModel = InsuraCardModel();
  bool isOpen = false;
  bool isSearch = false;
  bool isActive = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(color: Color(0xFFECF3EC)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/pngs/police.png',
                              height: 60,
                              width: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ILLINOIS STATE POLICE",
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Bold',
                                      color: Colors.black54),
                                ),
                                Text(
                                  "Vehicle Insurance Checker Portal",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Poppins-Medium',
                                      color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/pngs/logobg1.png',
                          height: 120,
                          width: 100,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Check Policy Numbers of Motorists Across The State To Make Sure They are In  Good Standing",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Bold',
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Check and View Their Policy Details",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins-Medium',
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 320,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check Policy Status",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins-Medium',
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.3)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: idNumberController,
                                onSaved: (value) {
                                  idNumberController.text = value.toString();
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter Vehicle Policy Number",
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 16,
                                      fontFamily: 'Poppins-Regular'),
                                  border: OutlineInputBorder(),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        InsuraData.checker(context, idNumberController.text)
                            .then((response) {
                          if (response['status'] == false) {
                            setState(() {
                              isActive = true;
                              cardModel = response['data'];
                              isSearch = true;
                            });
                          } else {
                            setState(() {
                              isActive = false;
                              cardModel = response['data'];
                              isSearch = true;
                            });
                          }
                        });
                        setState(() {
                          isLoading = true;
                        });
                        Timer(Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF20B038),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: isLoading
                              ? SpinKitDoubleBounce(
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Center(
                                  child: Text(
                                    'Check',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins-Medium',
                                        color: Colors.white),
                                  ),
                                )),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Policy Status",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: 16,
                      ),
                    ),
                    if (isSearch == false)
                      // policy card status message
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 100,
                          child: Center(
                            child: Text(
                              'No Policy Status Here',
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
                    if (isSearch == true)
                      statusCard(_width, _height, cardModel, isActive),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Padding statusCard(
      double _width, double _height, InsuraCardModel cardModel, bool isActive) {
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Colors.white;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          width: _width,
          height: _height <= 700 ? 185 : 200,
          decoration: BoxDecoration(
            color: color,
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
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: isActive ? Color(0xFFA7CD3A) : Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isActive
                                ? "Insurance Policy Active"
                                : "Insurance Policy Inactive",
                            style: TextStyle(
                              fontSize: 16,
                              color: isActive ? Color(0xFFA7CD3A) : Colors.red,
                              fontFamily: "Poppins-Bold",
                            ),
                          ),
                          Text(
                            "${cardModel.company}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: isActive ? Colors.white60 : Colors.red,
                              fontFamily: "Poppins-Bold",
                            ),
                          ),
                          Text(
                            "Insurance type: Vehicle Insurance",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontFamily: "Poppins-Light",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _height <= 700 ? 9 : 12.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _height <= 700 ? 13 : 15.0, right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PolicyDetails(
                                cardModel: cardModel, isActive: isActive),
                          ),
                        );
                      },
                      child: Text(
                        "REVIEW",
                        style: TextStyle(
                          fontSize: 16,
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
    );
  }
}
