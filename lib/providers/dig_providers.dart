import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Models/insura_.model.dart';

class DigitalProvider extends ChangeNotifier {
  DigitalIDModel _digitalIDModel = DigitalIDModel();
  DateTime now = DateTime.now();
  // bool _isExpira = true;

  DigitalIDModel get digitalIDModel => _digitalIDModel;
  // bool get isExpira => _isExpira;

  void addDigitalCard(DigitalIDModel mycard) {
    _digitalIDModel = mycard;
    notifyListeners();
  }
}
