import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Models/insura_.model.dart';

//class for insuradata
class InsuraData {
  //get insura data
  Future getInsuraData(BuildContext context) async {
    List<InsuraCardModel> cards = []; //list of insura cards

    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('insuracard'); //getting data from

    try {
      //checking for error
      await collectionReference.get().then((value) {
        for (var result in value.docs) {
          //adding card to card list
          cards.add(InsuraCardModel(
            policyNumber: result['policyNumber'],
            year: result['year'],
            effectiveDate: result['effective_date'],
            expirationDate: result['expiration_date'],
            company: result['company'],
            maker: result['maker'],
            naic: result['naic'],
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
    return cards;
  }

  //checker function
  static Future checker(BuildContext context, String id) async {
    List<InsuraCardModel> polcy = []; //policy list

    DateTime now = DateTime.now();
    InsuraCardModel cardModel;

    bool isExpActive = false;

//getting all policy
    final collectionReference =
        FirebaseFirestore.instance.collection('insuracard');

    try {
      await collectionReference.get().then((value) {
        for (var result in value.docs) {
          print("Date here: " + value.toString());
          // ---
          polcy.add(InsuraCardModel(
            policyNumber: result['policyNumber'],
            year: result['year'],
            effectiveDate: result['effective_date'].toDate(),
            expirationDate: result['expiration_date'].toDate(),
            company: result['company'],
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
    //looping through all the policy list
    polcy.forEach((element) {
      //checking if the id is in one of them
      if (id == element.policyNumber) {
        cardModel = polcy.firstWhere(
            (card) => card.policyNumber == id); //signing to policy to a card

        final expirationDate = DateTime(
            cardModel.expirationDate!.year.toInt(),
            cardModel.expirationDate!.month.toInt(),
            cardModel.expirationDate!.day.toInt(),
            );

        bool isExpira =
            expirationDate.isBefore(now); //check for expiration date

        if (isExpira) {
          isExpActive = false;
        } else {
          isExpActive = true;
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Found',
          desc: 'Is Not Found',
          btnOkOnPress: () {},
        )..show();
      }
    });

    return {
      'data': '',
      'isExpired': isExpActive,
    };
  }
}