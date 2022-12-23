import 'package:flutter/foundation.dart' show immutable;

abstract class AppState {}

@immutable
class SUCCESS implements AppState {
  // this can be any model of data comming from api or the local database
  final dynamic value;

  const SUCCESS({this.value});
}

@immutable
class ERROR implements AppState {
  final String? dueTo;

  const ERROR({this.dueTo});
}

@immutable
class LOADING implements AppState {
  final String? message;

  const LOADING({this.message});
}

@immutable
class INITIALSTATE implements AppState {}
