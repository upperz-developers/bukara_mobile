import '../shared/common_modele.dart';

class TenantResult {
  bool? status;
  Data? data;

  TenantResult({this.status, this.data});

  TenantResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Meta? meta;
  List<TenantModel>? data;

  Data({this.meta, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <TenantModel>[];
      json['data'].forEach((v) {
        data!.add(TenantModel.fromJson(v));
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
  String? nextPageUrl;
  String? previousPageUrl;

  Meta(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.firstPage,
      this.firstPageUrl,
      this.lastPageUrl,
      this.nextPageUrl,
      this.previousPageUrl});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    firstPage = json['first_page'];
    firstPageUrl = json['first_page_url'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    previousPageUrl = json['previous_page_url'];
  }
}

class TenantModel {
  String? id;
  String? name;
  String? lastname;
  String? email;
  String? profile;
  String? cardType;
  String? cardTypeId;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Phones>? phones;

  TenantModel(
      {this.id,
      this.name,
      this.lastname,
      this.email,
      this.profile,
      this.cardType,
      this.cardTypeId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.phones});

  TenantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    profile = json['profile'];
    cardType = json['card_type'];
    cardTypeId = json['card_type_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
  }
}
