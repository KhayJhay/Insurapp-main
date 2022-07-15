import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/checkerpage/digitalForm.dart';
import '../Models/insura_.model.dart';
import '../providers/theme_provider.dart';

class DigitalNullCard extends StatelessWidget {
  const DigitalNullCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Digital ID added yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Poppins-Light",
          ),
        ),
        Text(
          'Press the button bellow to add yours',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Poppins-Light",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DigitalForm()),
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
                      color: Color(0xFF44A8E0), blurRadius: 4, spreadRadius: 1),
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
    );
  }
}

class DigitalCard extends StatefulWidget {
  const DigitalCard({
    Key? key,
    required double width,
    required double height,
    required DigitalIDModel digiatal,
    // required InsuraCardModel digitalIDModel,
    required this.isActive,
  })  : _width = width,
        _height = height,
        _digiatal = digiatal,
        //_digitalIDModel = digitalIDModel,
        super(key: key);

  final double _width;
  final double _height;
  final DigitalIDModel _digiatal;
  //final InsuraCardModel _digitalIDModel;
  final bool isActive;

  @override
  State<DigitalCard> createState() => _DigitalCardState();
}

class _DigitalCardState extends State<DigitalCard> {
  @override
  Widget build(BuildContext context) {
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
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
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: widget._width,
            height: widget._height <= 700 ? 370 : 380,
            decoration: BoxDecoration(
              color: appbar_color,
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
                    SizedBox(width: 200),
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
                              '${widget._digiatal.profile}',
                            )),
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
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${widget._digiatal.insured}",
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
                                    text: "\n${widget._digiatal.company}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF303F46),
                                      fontFamily: "Poppins-Bold",
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "\nID: ${widget._digiatal.policyNumber}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontFamily: "Poppins-Regular",
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
                    top: widget._height <= 700 ? 20 : 30.0,
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
            ),
          ),
        ),
        //card
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
              width: widget._width,
              height: widget._height <= 700 ? 185 : 200,
              decoration: BoxDecoration(
                color: appbar_color,
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
                        child: SizedBox(width: 200),
                      ),
                      IconButton(
                        onPressed: () {},
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
                          widget.isActive
                              ? CupertinoIcons.check_mark_circled
                              : CupertinoIcons.multiply_circle,
                          size: widget._height <= 700 ? 50 : 60,
                          color:
                              widget.isActive ? Color(0xFFA7CD3A) : Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.isActive
                                            ? "Insurance Policy Active"
                                            : "Insurance Policy Inactive",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: widget.isActive
                                              ? Color(0xFFA7CD3A)
                                              : Colors.red,
                                          fontFamily: "Poppins-Bold",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\n${widget._digiatal.company}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: widget.isActive
                                              ? Color(0xFF303F46)
                                              : Colors.red,
                                          fontFamily: "Poppins-Bold",
                                        ),
                                      ),
                                      TextSpan(
                                          text: "\n${widget._digiatal.model}",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontFamily: "Poppins-Regular",
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
                    padding:
                        EdgeInsets.only(top: widget._height <= 700 ? 9 : 12.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: widget._height <= 700 ? 13 : 15.0,
                        right: 25,
                        left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => PolicyDetails(
                            //         cardModel: widget._digiatal,
                            //         isActive: widget.isActive),
                            //   ),
                            // );
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
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
