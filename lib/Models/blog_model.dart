import 'package:cloud_firestore/cloud_firestore.dart';

class BlogCategory {
  String? catID;
  String? title;
  String? backgroundImage;

  BlogCategory({this.catID, this.title, this.backgroundImage});

  BlogCategory.fromJson(Map<String, dynamic> json) {
    catID = json['catID'];
    title = json['title'];
    backgroundImage = json['backgroundImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['catID'] = catID;
    data['title'] = title;
    data['backgroundImage'] = backgroundImage;
    return data;
  }
}

class Blog {
  String? title;
  String? categoryID;
  String? description;
  String? bgImage;
  DateTime? createdOn;

  Blog({
    this.title,
    this.categoryID,
    this.description,
    this.bgImage,
    this.createdOn,
  });

  Blog.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    categoryID = json['categoryID'];
    description = json['description'];
    bgImage = json['bgImage'];
    createdOn = (json['created_on'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['categoryID'] = categoryID;
    data['description'] = description;
    data['bgImage'] = bgImage;
    data['created_on'] = createdOn;
    return data;
  }
}
