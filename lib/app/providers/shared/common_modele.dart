class Addresses {
  String? id;
  String? entrepriseId;
  String? country;
  String? town;
  String? reference;
  String? city;
  String? quarter;
  String? street;
  int? number;
  String? createdAt;
  String? updatedAt;

  Addresses(
      {this.id,
      this.entrepriseId,
      this.country,
      this.town,
      this.city,
      this.quarter,
      this.street,
      this.number,
      this.createdAt,
      this.reference,
      this.updatedAt});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entrepriseId = json['entreprise_id'];
    country = json['country'];
    town = json['town'];
    city = json['city'];
    quarter = json['quarter'];
    street = json['street'];
    number = json['number'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['entreprise_id'] = entrepriseId;
    data['country'] = country;
    data['town'] = town;
    data['reference'] = reference;
    data['city'] = city;
    data['quarter'] = quarter;
    data['street'] = street;
    data['number'] = number;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ImageModel {
  String? id;
  String? url;
  String? createdAt;
  String? updatedAt;

  ImageModel({this.id, this.url, this.createdAt, this.updatedAt});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class TypeBiens {
  String? id;
  String? designation;
  String? description;

  TypeBiens({this.id, this.designation, this.description});

  TypeBiens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['designation'] = designation;
    data['description'] = description;
    return data;
  }
}

class TypeAppart {
  String? id;
  String? designation;
  String? description;

  TypeAppart({this.id, this.designation, this.description});

  TypeAppart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    description = json['description'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['designation'] = designation;
    data['description'] = description;
    return data;
  }
}

class Phones {
  String? id;
  String? personneId;
  String? countryCode;
  String? number;
  String? createdAt;
  String? updatedAt;

  Phones(
      {this.id,
      this.personneId,
      this.countryCode,
      this.number,
      this.createdAt,
      this.updatedAt});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personneId = json['personne_id'];
    countryCode = json['countryCode'];
    number = json['number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class ErrorModel {
  List<ErrorData>? errors;

  ErrorModel() : errors = [];

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errors = [];
    if (json['errors'] != null) {
      errors = <ErrorData>[];
      json['errors'].forEach((v) {
        errors!.add(ErrorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ErrorData {
  String? rule;
  String? field;
  String? message;

  ErrorData({this.rule, this.field, this.message});

  ErrorData.fromJson(Map<String, dynamic> json) {
    rule = json['rule'];
    field = json['field'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        "rule": rule,
        "field": field,
        "message": message,
      };
}
