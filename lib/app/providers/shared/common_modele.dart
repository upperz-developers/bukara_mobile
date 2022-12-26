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