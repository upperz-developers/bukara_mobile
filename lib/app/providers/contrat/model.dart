import 'package:bukara/app/providers/suite/modele.dart';

import '../user/model.dart';

class ContratRent {
  bool? status;
  Data? data;

  ContratRent({this.status, this.data});

  ContratRent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Contrat>? contrats;

  Data({this.contrats});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      contrats = <Contrat>[];
      json['data'].forEach((v) {
        contrats!.add(Contrat.fromJson(v));
      });
    }
  }
}

class Contrat {
  String? id;
  User? user;
  SuiteModel? appartement;
  Landlord? landlord;
  int? numberOfHabitant;
  int? amount;
  String? currency;
  String? startDate;
  String? endDate;
  bool? current;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Contrat({
    this.id,
    this.user,
    this.appartement,
    this.landlord,
    this.numberOfHabitant,
    this.amount,
    this.currency,
    this.startDate,
    this.endDate,
    this.current,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Contrat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    appartement = json['appartement'] != null
        ? SuiteModel.fromJson(json['appartement'])
        : null;
    landlord =
        json['landlord'] != null ? Landlord.fromJson(json['landlord']) : null;
    numberOfHabitant = json['number_of_habitant'];
    amount = json['amount'];
    currency = json['currency'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    current = json['current'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Landlord {
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? profile;

  Landlord({this.id, this.name, this.lastname, this.email, this.profile});

  Landlord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    profile = json['profile'];
  }
}
