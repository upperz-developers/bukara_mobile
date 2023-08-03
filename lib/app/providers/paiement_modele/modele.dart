import 'package:bukara/app/providers/recouvrenement/modele.dart';

class ResultHistoricPaiements {
  bool? status;
  Data? data;

  ResultHistoricPaiements({this.status, this.data});

  ResultHistoricPaiements.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Meta? meta;
  List<PayementHistoric>? payments;

  Data({this.meta, this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      payments = <PayementHistoric>[];
      json['data'].forEach((p) {
        payments!.add(PayementHistoric.fromJson(p));
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

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
  });

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

class PayementHistoric {
  String? id;
  ContratData? contratData;
  String? type;
  User? createdBy;
  String? transactionId;
  double? amount;
  String? currenty;
  bool? status;
  String? createdAt;
  String? updatedAt;

  PayementHistoric(
      {this.id,
      this.contratData,
      this.type,
      this.transactionId,
      this.amount,
      this.currenty,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy});

  PayementHistoric.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contratData = json['recovery'] != null
        ? ContratData.fromJson(json['recovery'])
        : null;
    createdBy =
        json['created_by'] != null ? User.fromJson(json['created_by']) : null;
    type = json['type'];
    transactionId = json['transaction_id'];
    amount = double.parse(json['amount'].toString());
    currenty = json['currenty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy =
        json['created_by'] != null && json['created_by'].runtimeType != String
            ? User.fromJson(json['created_by'])
            : null;
  }
}
