import 'package:cloud_firestore/cloud_firestore.dart';

class UserCrud {
  //getting a user
  Future<dynamic> getData(String userId) async {
    final data = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userId)
        .get();
    return data;
  }

  
}
