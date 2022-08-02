// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../Models/insura_.model.dart';
import '../../providers/dig_providers.dart';
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

  @override
  Widget build(BuildContext context) {
    final digitalProvider = Provider.of<DigitalProvider>(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('digitalCard')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: DigitalNullCard(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: DigitalNullCard(),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          _digiatal = DigitalIDModel.fromJson(
            snapshot.data.docs.first.data(),
          );
          digitalProvider.addDigitalCard(_digiatal);
          return Center(
            child: DigitalCard(
              width: _width,
              height: _height,
              digiatal: _digiatal,
              isActive: isActive,
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
  }
}
