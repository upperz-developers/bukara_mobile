import 'package:flutter/foundation.dart' show immutable;

abstract class AppEvent {}

@immutable
class LOGIN implements AppEvent {
  final String? email;
  final String? password;

  const LOGIN({this.email, this.password});
}

class SINGUP implements AppEvent {
  final String? email;
  final String? password;
  final String? confirmepassword;

  const SINGUP({
    this.email,
    this.password,
    this.confirmepassword,
  });
}

class GETSUITE implements AppEvent {}
