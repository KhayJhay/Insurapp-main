import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Models/insura_.model.dart';

//class for insuradata

//class for insuradata
class InsuraData {
  //get insura data
  Future getInsuraData(BuildContext context, String id) async {}

  //checker function
  static Future checker(BuildContext context, String id) async {
    List<InsuraCardModel> polcy = []; //policy list

    DateTime now = DateTime.now();
    InsuraCardModel cardModel;

    bool isExpira;

    var response;

    //getting all policy
    final collectionReference =
    FirebaseFirestore.instance.collection('insuracard');

    try {
      await collectionReference.get().then((value) {
        for (var result in value.docs) {
          polcy.add(InsuraCardModel(
            id: result.id,
            policyNumber: result['policyNumber'],
            year: result['year'],
            effectiveDate: result['effective_date'].toDate(),
            expirationDate: result['expiration_date'].toDate(),
            company: result['company'],
            model: result['model'],
            maker: result['maker'],
            naic: result['naic'].toString(),
            vin: result['vin'],
            insured: result['insured'],
          ));
        }
      });
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Data Collection Error',
        desc: '$e ..Please press OK to reload or check internet connection',
        btnOkOnPress: () {},
      )..show();
    }

    //signing to policy to a card
    cardModel = polcy.firstWhere((card) => card.policyNumber == id);

    //checking if the id is in one of them
    if (id == cardModel.policyNumber) {
      final expirationDate = DateTime(
        cardModel.expirationDate!.year.toInt(),
        cardModel.expirationDate!.month.toInt(),
        cardModel.expirationDate!.day.toInt(),
      );

      //check for expiration date
      isExpira = expirationDate.isBefore(now);

      response = {
        'status': isExpira,
        'data': cardModel,
      };
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Found',
        desc: 'Is Not Found',
        btnOkOnPress: () {},
      )..show();
      response = {
        'status': '',
        'data': '',
      };
    }

    return response;
  }

  static Future addDigitalCard(BuildContext context, String userId,
      InsuraCardModel policyId, profile) async {
    Map<String, dynamic> body = {
      'userId': userId,
      'profile': profile,
      'policyNumber': policyId.policyNumber,
      'year': policyId.year,
      'effectiveDate': policyId.effectiveDate,
      'expirationDate': policyId.expirationDate,
      'company': policyId.company,
      'model': policyId.model,
      'maker': policyId.maker,
      'naic': policyId.naic,
      'vin': policyId.vin,
      'insured': policyId.insured,
    };
    FirebaseFirestore.instance
        .collection('digitalCard')
        .add(body)
        .then((value) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Digital Card',
        desc: 'Your ID is successfully added',
        btnOkOnPress: () {},
      )..show();
    }).catchError((onError) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Digital Card',
        desc: '$onError please try again!',
        btnOkOnPress: () {},
      )..show();
    });
  }
}