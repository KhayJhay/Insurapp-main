import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home/checkerpage/checker_page.dart';
import '../Home/checkerpage/digitalForm.dart';
import '../Home/checkerpage/policy_details.dart';
import '../Models/insura_.model.dart';
import '../providers/theme_provider.dart';

class DigitalNullCard extends StatelessWidget {
  const DigitalNullCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar_color =
    Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
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
                MaterialPageRoute(builder: (context) => Checker_Page()),
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
    required this.isActive,
  })  : _width = width,
        _height = height,
        _digiatal = digiatal,
        super(key: key);

  final double _width;
  final double _height;
  final DigitalIDModel _digiatal;
  final bool isActive;

  @override
  State<DigitalCard> createState() => _DigitalCardState();
}

class _DigitalCardState extends State<DigitalCard> {
  late InsuraCardModel cardModel = InsuraCardModel();
  @override
  Widget build(BuildContext context) {
    cardModel = InsuraCardModel(
        id: widget._digiatal.userId,
        policyNumber: widget._digiatal.policyNumber,
        year: widget._digiatal.year,
        maker: widget._digiatal.maker,
        model: widget._digiatal.model,
        effectiveDate: widget._digiatal.effectiveDate,
        expirationDate: widget._digiatal.expirationDate,
        company: widget._digiatal.company,
        vin: widget._digiatal.vin,
        naic: widget._digiatal.naic,
        insured: widget._digiatal.insured);

    final appbar_color =
    Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey.shade700
        : Colors.white;
    //
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
                                      fontSize: 14,
                                      color: Color(0xFF303F46),
                                      fontFamily: "Poppins-Bold",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n${widget._digiatal.company}",
                                    style: TextStyle(
                                      fontSize: 12,
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
                      widget.isActive
                          ? "  " "Verified"
                          : " " "Not Verified",
                      style: TextStyle(
                        fontSize: 18,
                        color: widget.isActive
                            ? Color(0xFF1D95DA)
                            : Colors.red,
                        letterSpacing: 2,
                        fontFamily: "Poppins-Light",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //title
      ],
    );
  }
}