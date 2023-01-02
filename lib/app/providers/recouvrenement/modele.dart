import '../suite/modele.dart';

class ResultRecovery {
  bool? status;
  Data? data;

  ResultRecovery({this.status, this.data});

  ResultRecovery.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Meta? meta;
  List<ContratData>? contratData;

  Data({this.meta, this.contratData});

  Data.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      contratData = <ContratData>[];
      json['data'].forEach((v) {
        contratData!.add(ContratData.fromJson(v));
      });
    }
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? firstPage;
  String? firstPageUrl;
  String? lastPageUrl;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPage,
    this.firstPageUrl,
    this.lastPageUrl,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    firstPage = json['first_page'];
    firstPageUrl = json['first_page_url'];
    lastPageUrl = json['last_page_url'];
  }
}

class ContratData {
  String? id;
  RentalContrat? rentalContrat;
  String? labelMonth;
  String? labelStr;
  String? dateRecovery;
  bool? status;
  String? createdAt;
  String? updatedAt;

  ContratData({
    this.id,
    this.rentalContrat,
    this.labelMonth,
    this.labelStr,
    this.dateRecovery,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  ContratData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rentalContrat = json['rentalContrat'] != null
        ? RentalContrat.fromJson(json['rentalContrat'])
        : null;
    labelMonth = json['label_month'];
    labelStr = json['label_str'];
    dateRecovery = json['date_recovery'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class RentalContrat {
  String? id;
  User? user;
  SuiteModel? appartement;
  Landlord? landlord;
  int? numberOfHabitant;
  int? amount;
  String? currency;
  String? startDate;
  bool? current;

  RentalContrat(
      {this.id,
      this.user,
      this.appartement,
      this.landlord,
      this.numberOfHabitant,
      this.amount,
      this.currency,
      this.startDate,
      this.current});

  RentalContrat.fromJson(Map<String, dynamic> json) {
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
    current = json['current'];
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

  User(
      {this.id,
      this.name,
      this.lastname,
      this.countryCode,
      this.phoneNumber,
      this.email,
      this.profile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    profile = json['profile'];
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
