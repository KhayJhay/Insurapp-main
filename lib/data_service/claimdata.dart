import 'package:cloud_firestore/cloud_firestore.dart';

class ClaimData {
  //sending claims
  static Future sendClaim(String id, userID, claimStatus, video, images,
      location, createdOn) async {
    var response;
    final Map<String, dynamic> body = {
      'userID': userID,
      'claimStatus': claimStatus,
      'video': video,
      'images': images,
      'location': location,
      'createdOn': createdOn
    };

    await FirebaseFirestore.instance
        .collection('claims')
        .add(body)
        .then((value) {
      response = {'status': true, 'message': 'Successful'};
      return response;
    }).catchError((e) {
      response = {'status': false, 'message': e.toString()};
      return response;
    });
  }
}
