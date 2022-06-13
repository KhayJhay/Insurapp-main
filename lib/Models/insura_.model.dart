class InsuraCardModel {
  String? policyNumber;
  String? year;
  String? maker;
  String? insured;
  String? company;
  String? vin;
  DateTime? effectiveDate;
  DateTime? expirationDate;
  String? naic;

  InsuraCardModel({
    this.policyNumber,
    this.year,
    this.maker,
    this.insured,
    this.company,
    this.vin,
    this.effectiveDate,
    this.expirationDate,
    this.naic,
  });

  InsuraCardModel.fromJson(Map<String, dynamic> json) {
    policyNumber = json['policyNumber'];
    year = json['year'];
    maker = json['maker'];
    insured = json['insured'];
    company = json['company'];
    vin = json['vin'];
    effectiveDate = json['effective_date'];
    expirationDate = json['expiration_date'];
    naic = json['naic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['policyNumber'] = policyNumber;
    data['year'] = year;
    data['maker'] = maker;
    data['insured'] = insured;
    data['company'] = company;
    data['vin'] = vin;
    data['effective_date'] = effectiveDate;
    data['expiration_date'] = expirationDate;
    data['naic'] = naic;
    return data;
  }
}
