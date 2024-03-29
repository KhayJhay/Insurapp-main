import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DigitalIDModel {
  String? userId;
  String? profile;
  String? policyNumber;
  String? year;
  String? maker;
  String? insured;
  String? model;
  String? company;
  String? vin;
  DateTime? effectiveDate;
  DateTime? expirationDate;
  String? naic;

  DigitalIDModel({
    this.userId,
    this.profile,
    this.policyNumber,
    this.year,
    this.maker,
    this.insured,
    this.model,
    this.company,
    this.vin,
    this.effectiveDate,
    this.expirationDate,
    this.naic,
  });

  DigitalIDModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    profile = json['profile'];
    policyNumber = json['policyNumber'];
    year = json['year'];
    maker = json['maker'];
    insured = json['insured'];
    model = json['model'];
    company = json['company'];
    vin = json['vin'];
    // effectiveDate = json['effective_date'];7hs
    // expirationDate = json['expiration_date'];
        (BuildContext context) {
      effectiveDate = (Theme.of(context).platform == TargetPlatform.iOS
          ? DateFormat('dd MMM kk:mm').format(json['effective_date'].toDate())
          : DateFormat('dd MMM kk:mm')
          .format(json['effective_date'].toDate())) as DateTime?;
      expirationDate = (Theme.of(context).platform == TargetPlatform.iOS
          ? DateFormat('dd MMM kk:mm').format(json['expiration_date'].toDate())
          : DateFormat('dd MMM kk:mm')
          .format(json['expiration_date'].toDate())) as DateTime?;
    };
    naic = json['naic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['profile'] = profile;
    data['policyNumber'] = policyNumber;
    data['year'] = year;
    data['maker'] = maker;
    data['insured'] = insured;
    data['model'] = model;
    data['company'] = company;
    data['vin'] = vin;
    data['effective_date'] = effectiveDate;
    data['expiration_date'] = expirationDate;
    data['naic'] = naic;
    return data;
  }
}

//insura model
class InsuraCardModel {
  String? id;
  String? policyNumber;
  String? year;
  String? maker;
  String? insured;
  String? model;
  String? company;
  String? vin;
  DateTime? effectiveDate;
  DateTime? expirationDate;
  String? naic;

  InsuraCardModel({
    this.id,
    this.policyNumber,
    this.year,
    this.maker,
    this.insured,
    this.model,
    this.company,
    this.vin,
    this.effectiveDate,
    this.expirationDate,
    this.naic,
  });

  late BuildContext context;

  InsuraCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    policyNumber = json['policyNumber'];
    year = json['year'];
    maker = json['maker'];
    insured = json['insured'];
    model = json['model'];
    company = json['company'];
    vin = json['vin'];
    effectiveDate = (Theme.of(context).platform == TargetPlatform.iOS
        ? DateFormat('dd MMM kk:mm').format(json['effective_date'].toDate())
        : DateFormat('dd MMM kk:mm')
        .format(json['effective_date'].toDate())) as DateTime?;
    expirationDate = (Theme.of(context).platform == TargetPlatform.iOS
        ? DateFormat('dd MMM kk:mm').format(json['expiration_date'].toDate())
        : DateFormat('dd MMM kk:mm')
        .format(json['expiration_date'].toDate())) as DateTime?;
    naic = json['naic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['policyNumber'] = policyNumber;
    data['year'] = year;
    data['maker'] = maker;
    data['insured'] = insured;
    data['model'] = model;
    data['company'] = company;
    data['vin'] = vin;
    data['effective_date'] = effectiveDate;
    data['expiration_date'] = expirationDate;
    data['naic'] = naic;
    return data;
  }
}
