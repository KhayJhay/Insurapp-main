class ClaimModel {
  String? userID;
  
  String? claimStatus;
  String? video;
  Images? images;
  String? location;
  String? createdOn;

  ClaimModel({
    this.userID,
    this.claimStatus,
    this.video,
    this.images,
    this.location,
    this.createdOn,
  });

  ClaimModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    claimStatus = json['ClaimStatus'];
    video = json['video'];
    images = json['images'] != null ? new Images.fromJson(json['images']) : null;
    location = json['location'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['ClaimStatus'] = claimStatus;
    data['video'] = video;
    if (this.images != null) {
      data['images'] = images!.toJson();
    }
    data['location'] = location;
    data['created_on'] = createdOn;
    return data;
  }
}

class Images {
  String? file;
  String? claimId;

  Images({this.file, this.claimId});

  Images.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    claimId = json['claimId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['claimId'] = claimId;
    return data;
  }
}
