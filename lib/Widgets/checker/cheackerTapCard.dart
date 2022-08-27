import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:insurapp/Models/users.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Home/checkerpage/digitalForm.dart';
import '../../Home/checkerpage/policy_details.dart';
import '../../Models/insura_.model.dart';
import '../../data_service/insura_data.dart';
import '../../providers/theme_provider.dart';

class CheckerTab extends StatefulWidget {
  const CheckerTab({Key? key}) : super(key: key);

  @override
  State<CheckerTab> createState() => _CheckerTabState();
}


class _CheckerTabState extends State<CheckerTab> {
  final idNumberController = TextEditingController();
  InsuraCardModel cardModel = InsuraCardModel();

  bool isSearch = false;
  bool isActive = false;
  bool isLoading = false;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isOpen = false;

  //getting users by default
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromJson(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color =
    Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey.shade800
        : Color(0xFFE8F3F3);
    var userName = FirebaseAuth.instance.currentUser!.displayName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            width: _width,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 3),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 60.0, right: 60, top: 30),
                  child: Lottie.asset('assets/lotties/check.json'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Hello, ${loggedInUser.username}! Check Your \nVehicle Policy Status Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                            hintText: "Enter Policy Number",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
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
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xFF6F8827),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                          child: isLoading
                              ? SpinKitSpinningLines(
                            color: Colors.white,
                            size: 30,
                          )
                              : Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Policy Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
            ),
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
                  'No policy card status here',
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
        if (isSearch == true) statusCard(_width, _height, cardModel, isActive),
      ],
    );
  }

  // status card
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
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DigitalForm(
                            cardID: cardModel.id,
                            isActive: isActive,
                            cardModel: cardModel,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.ellipsis,
                      color: Color(0xFF303F46),
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
                              color:
                              isActive ? Color(0xFFA7CD3A) : Colors.red,
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