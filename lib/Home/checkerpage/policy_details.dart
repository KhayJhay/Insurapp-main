import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PolicyDetails extends StatelessWidget {
  static String id = 'policydetails';
  const PolicyDetails({Key? key}) : super(key: key);

  @override
  //New Changes
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F4),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
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
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell_solid, color: Colors.grey,size: 26,),),
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
                color: Color(0xFFE3E7E8),
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
                    color: Color(0xFF303F46),
                  ),
                ),
              ),
            ),
            buildPolicyDetails(context),
          ],
        ),
      ),
    );
  }
}
Widget buildPolicyDetails(BuildContext context){

  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('insurance status').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(color: Colors.blue,),
          );
        }else{
          return Column(
            children: <Widget>[
              ...snapshot.data!.docs.map((QueryDocumentSnapshot<Object?>data){
                final String polNumber = data.get('policyNumber');
                final String company = data.get('company');
                final String status = data.get('status');
                final String make = data.get('make');
                final String model = data.get('model');
                final String naic = data.get('naic');
                final String vehicleID = data.get('vehicle ID');
                final String year = data.get('year');
                final String eff_date = data.get('effective_date');
                final String exp_date = data.get('expiration_date');
                final String insured = data.get('insured');
                return Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 20),
                  child: Column(
                    children:[
                      Card(
                        child: ListTile(
                          title: Text("Insurance Company",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-SemiBold",
                            ),),
                          subtitle:  Text(company, style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF303F46),
                            fontFamily: "Poppins-Light",
                          ),),
                          leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Insurance Policy Number",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(polNumber, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Car Brand / Make",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(make, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Car Model",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(model, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Insured",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(insured, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("naic",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(naic, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Effective Date",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(eff_date, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Expiration Date",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(exp_date, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Insurance Status",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(status, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFA7CD3A),
                              fontFamily: "Poppins-Bold",
                            ),),
                            leading:  SizedBox(
                              child: Icon(
                                CupertinoIcons.check_mark_circled,
                                size: 40,
                                color: Color(0xFFA7CD3A),
                              ),
                              height: 60,
                              width: 60,
                            ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Vehicle ID",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(vehicleID, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                      Card(
                        child: ListTile(
                            title: Text("Car Year",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF303F46),
                                fontFamily: "Poppins-SemiBold",
                              ),),
                            subtitle:  Text(year, style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF303F46),
                              fontFamily: "Poppins-Light",
                            ),),
                            leading:  Image.asset("assets/pngs/logobg2.png")
                        ),
                      ),
                      SizedBox(height: 15,),
                    ]
                  ),
                );
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
              }),
            ],
          );
        }
      });
}