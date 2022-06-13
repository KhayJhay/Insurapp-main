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

    try { //checking for error
      await collectionReference.get().then((value) {
        for (var result in value.docs) {
          //adding card to card list
          cards.add(InsuraCardModel(
            policyNumber: result['policyNumber'],
            year: result['year'],
            effectiveDate: result['effectiveDate'],
            expirationDate: result['expirationDate'],
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
  void checker(BuildContext context, String id) async {
    List<InsuraCardModel> polcy = []; //policy list

    bool isFound = false; 
    DateTime now = DateTime.now();
    InsuraCardModel cardModel;

    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('insuracard'); //getting all policy

    try {
      await collectionReference.get().then((value) {
        for (var result in value.docs) {
          polcy.add(InsuraCardModel(
            policyNumber: result['policyNumber'],
            year: result['year'],
            effectiveDate: result['effectiveDate'],
            expirationDate: result['expirationDate'],
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

    polcy.forEach((element) { //looping through all the policy list
      if (id == element.policyNumber) { //checking if the id is in one of them
      
        cardModel = polcy.firstWhere((card) => card.policyNumber == id); //signing to policy to a card
        final expirationDate = DateTime( 
            cardModel.expirationDate!.year.toInt(),
            cardModel.expirationDate!.month.toInt(),
            cardModel.expirationDate!.day.toInt());

        bool isExpira = expirationDate.isBefore(now); //check for expiration date 

        if (isExpira) {
          print('Is expired');
        } else {
          print('Is not expired');
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
  }
}
