import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurapp/Home/edit_profile_page.dart';
import 'package:lottie/lottie.dart';
import '../Models/users.dart';
import 'checkerpage/checker_page.dart';
class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
      this.loggedInUser = UserModel.fromJson(value.data());
      setState(() {});
    });
  }
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
        leading: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.slider_horizontal_3, color: Colors.grey,size: 26,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell_solid, color: Colors.grey,size: 26,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: _height*0.35,
              width: _width,
              decoration: BoxDecoration(
                color: Color(0xFF303F46),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/profile.jpg",),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 16.0,
                    sigmaY: 16.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0,left: 40 ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/profile.jpg",),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,),
                                    child: Text("${loggedInUser.username}",style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Medium"
                                    ),),
                                  ),
                                  Text("San Diego, Ca",style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Poppins-Light"
                                  ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0, right: 25),
                              child: Column(
                                children: <Widget>[
                                  Text("TOP ACTIVITIES",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontFamily: "Poppins-Light",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset( "assets/pngs/approval.png",),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text("Verified",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: "Poppins-SemiBold",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset( "assets/pngs/claim2.png",),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text("Current Claims 0",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: "Poppins-SemiBold",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 38),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Edit_Profile_Page.id);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFF3F4),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,width: 0.5)
                  ),
                  child: Center(
                    child: Text("EDIT PROFILE",
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text("INSURANCE",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF303F46),
                        fontFamily: "Poppins-Bold",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 8.0, right: 15, top: 8),
                    child: Container(
                      height: 175,
                      width: _width * 0.95,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F3F3),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20, bottom: 20),
                                child: Text(
                                  "Is Your Insurance\n Policy Valid?",
                                  style: TextStyle(
                                      color: Color(0xFF303F46),
                                      fontFamily: 'Poppins-SemiBold',
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 30.0, top: 5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Checker_Page()));
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 165,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF44A8E0),
                                      borderRadius: BorderRadius.circular(15),
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
                                        "Check Here",
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
                          SizedBox(
                              height: 130,
                              width: 160,
                              child: Lottie.asset('assets/lotties/check.json'))
                        ],
                      ),
                    ),
                  ),
                  /*StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('insurance status').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                         return Padding(
                            padding: const EdgeInsets.only(top:10.0,left: 20,right: 20),
                            child: Container(
                                width: _width,
                                height: 200,
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
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 315,),
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
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      Text("Your Policy Status is "+status,
                                                        style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(0xFF303F46),
                                                        fontFamily: "Poppins-Bold",
                                                      ),),
                                                      Text(company,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:  Color(0xFFA7CD3A),
                                                          fontFamily: "Poppins-Bold",
                                                        ),),
                                                      Text("Your Policy Status is "+ polNumber,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                          fontFamily: "Poppins-Light",
                                                        ),),
                                                    ],
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                  ),
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
                                    )
                                  ],
                                )
                            ),
                          );
                        }
                        )]
                        );
                      }
                    }
                  ), */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
