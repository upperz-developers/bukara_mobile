class ResultAuth {
  bool? status;
  Token? token;
  Data? data;

  ResultAuth({this.status, this.token, this.data});

  ResultAuth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Token {
  String? type;
  String? token;

  Token({this.type, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['token'] = token;
    return data;
  }
}

class Data {
  User? user;
  Config? config;

  Data({this.user, this.config});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
  }
}

class User {
  String? id;
  String? name;
  String? lastname;
  String? countryCode;
  String? phoneNumber;
  String? email;
  String? profile;
  bool? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.lastname,
      this.countryCode,
      this.phoneNumber,
      this.email,
      this.profile,
      this.status,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    profile = json['profile'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['lastname'] = lastname;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['profile'] = profile;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Config {
  List<TypeBiens>? typeBiens;

  Config({this.typeBiens});

  Config.fromJson(Map<String, dynamic> json) {
    if (json['typeBiens'] != null) {
      typeBiens = <TypeBiens>[];
      json['typeBiens'].forEach((v) {
        typeBiens!.add(TypeBiens.fromJson(v));
      });
    }
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
}
