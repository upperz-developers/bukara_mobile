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

class CHANGEPASSWORD implements AppEvent {
  final String? oldpassword;
  final String? newpassword;
  final String? confirmepassword;

  const CHANGEPASSWORD({
    this.oldpassword,
    this.newpassword,
    this.confirmepassword,
  });
}

class EDITERUSER implements AppEvent {
  final Map<String, dynamic> data;

  const EDITERUSER({required this.data});
}

class LOGOUT implements AppEvent {
  final String? token;

  const LOGOUT({
    this.token,
  });
}

class GETSUITE implements AppEvent {}

class GETTENANT implements AppEvent {}

class GETRECOVERYINFO implements AppEvent {}

class GETCONTRAT implements AppEvent {}

class GETPAYEMENT implements AppEvent {}

class GETPEYEMENTPERRECOVERY implements AppEvent {}
