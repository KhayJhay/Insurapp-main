import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Models/insura_.model.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class PolicyDetails extends StatefulWidget {
  static String id = 'policydetails';
  final bool isActive;
  InsuraCardModel cardModel;
  PolicyDetails({Key? key, required this.cardModel, required this.isActive})
      : super(key: key);

  @override
  State<PolicyDetails> createState() => _PolicyDetailsState();
}

class _PolicyDetailsState extends State<PolicyDetails> {
  @override
  //New Changes
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE8F3F3);
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: appbar_color,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell_solid,
              color: Colors.grey,
              size: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: welcome_color,
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
              ),
              child: Center(
                child: Text(
                  "Your Policy Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Medium",
                  ),
                ),
              ),
            ),
            buildPolicyDetails(
              context,
              widget.cardModel,
              widget.isActive,
            ),
          ],
        ),
      ),
    );
  }
}

buildPolicyDetails(
    BuildContext context, InsuraCardModel cardModel, bool isActive) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
        child: Column(children: [
          Card(
            child: ListTile(
                title: Text(
                  "Insurance Company",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.company.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Insurance Policy Number",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.policyNumber.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Car Brand / Make",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.maker.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Car Model",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.model.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Insured",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.insured.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "naic",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.naic.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Effective Date",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.effectiveDate.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Expiration Date",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.expirationDate.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
              title: Text(
                "Insurance Status",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-SemiBold",
                ),
              ),
              subtitle: Text(
                isActive ? 'Active' : 'Inactive', //edit here
                style: TextStyle(
                  fontSize: 16,
                  color: isActive ? Color(0xFFA7CD3A) : Colors.red,
                  fontFamily: "Poppins-Bold",
                ),
              ),
              leading: SizedBox(
                child: Icon(
                  isActive
                      ? CupertinoIcons.check_mark_circled
                      : CupertinoIcons.multiply_circle,
                  size: 40,
                  color: isActive ? Color(0xFFA7CD3A) : Colors.red,
                ),
                height: 60,
                width: 60,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Vehicle ID",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.vin.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: ListTile(
                title: Text(
                  "Car Year",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-SemiBold",
                  ),
                ),
                subtitle: Text(
                  cardModel.year.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Light",
                  ),
                ),
                leading: Image.asset("assets/pngs/logobg2.png")),
          ),
          SizedBox(
            height: 15,
          ),
        ]),

        /*
                          Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 320,),
                                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.ellipsis, color: Color(0xFF303F46),))
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.check_mark_circled,
                                    size: 60,
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
                                                text:"Insurance Policy Active",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF303F46),
                                                  fontFamily: "Poppins-Bold",
                                                ),
                                              ),
                                              TextSpan(
                                                text:company,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFFA7CD3A),
                                                  fontFamily: "Poppins-Bold",
                                                ),
                                              ),
                                              TextSpan(
                                                  text:"\nInsurance type: Vehicle Insurance",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontFamily: "Poppins-Regular",
                                                  )
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
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 0.3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0,right: 25,left: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("REVIEW",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      letterSpacing: 2,
                                      fontFamily: "Poppins-SemiBold",
                                    ),
                                  ),
                                  Text("SEND MEMO",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      letterSpacing: 2,
                                      fontFamily: "Poppins-SemiBold",
                                    ),
                                  ),
                                  Text("SHARE",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      letterSpacing: 2,
                                      fontFamily: "Poppins-SemiBold",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                        */
      ),
    ],
  );
}
