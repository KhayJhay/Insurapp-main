import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Models/insura_.model.dart';
import '../data_service/insura_data.dart';

class DigitalProvider extends ChangeNotifier {
  DigitalIDModel _digitalIDModel = DigitalIDModel();
  late bool _isExpira = true;

  DigitalIDModel get digitalIDModel => _digitalIDModel;
  bool get isExpira => _isExpira;

  void addDigitalCard(BuildContext context, DigitalIDModel mycard) {
    _digitalIDModel = mycard;
    InsuraData.checker(context, mycard.policyNumber.toString()).then((value) {
      _isExpira = value['status'];
    });
    notifyListeners();
  }
}