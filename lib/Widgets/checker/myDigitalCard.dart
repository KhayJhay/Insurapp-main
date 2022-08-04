// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Models/insura_.model.dart';
import '../digitalcard.dart';

class My_Digital_ID extends StatefulWidget {
  const My_Digital_ID({Key key}) : super(key: key);

  @override
  State<My_Digital_ID> createState() => _My_Digital_IDState();
}

class _My_Digital_IDState extends State<My_Digital_ID> {
  bool isFalse = false;
  bool isActive = true;
  DigitalIDModel _digiatal = DigitalIDModel();
  // InsuraCardModel _digitalIDModel = InsuraCardModel();

  // @override
  // void initState() {
  //   super.initState();
  //   DigitalProvider().getDigitalPage(context);
  // }

  @override
  Widget build(BuildContext context) {
    // DigitalProvider().getDigitalPage(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final collectionReference =
        FirebaseFirestore.instance.collection('insuracard');
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('digitalCard')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          print("ERROR");
          return Center(child: DigitalNullCard());
        }
        if (snapshot.hasData && snapshot.data != null) {
          print("${FirebaseAuth.instance.currentUser.uid}");
          print("Snapshot.data == ${snapshot.data}");
          print("Snapshot.data.docs == ${snapshot.data.docs}");

          // print("Snapshot.data == ${snapshot.data}");
          // _digiatal = DigitalIDModel.fromJson(snapshot.data.docs.first.data());
          print("Digital IDMODEL: $_digiatal");
          return Center(
            child: DigitalCard(
              width: _width,
              height: _height,
              digiatal: _digiatal,
              isActive: !isActive,
            ),
          );
        }
        return Center(
          child: SpinKitSpinningLines(
            color: Colors.lightGreen,
          ),
        );
      },
    );
    // _digiatal = DigitalProvider().digiatal;
    // _digitalIDModel = DigitalProvider().digitalIDModel;

    // if (DigitalProvider().isLoading) {
    //   return Center(
    //     child: SpinKitSpinningLines(
    //       color: Colors.lightGreen,
    //     ),
    //   );
    // } else {
    //   return Center(
    //     child: _digiatal.policyNumber!.isEmpty
    //         ? DigitalNullCard()
    //         : DigitalCard(
    //             width: _width,
    //             height: _height,
    //             digiatal: _digiatal,
    //             isActive: isActive),
    //   );
  }
}
