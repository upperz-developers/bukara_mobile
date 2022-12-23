import 'package:flutter/widgets.dart';

class AuthViewController {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpasssword = TextEditingController();
  TextEditingController codeapp = TextEditingController();

  bool loginValidate() => mail.text.isNotEmpty && password.text.isNotEmpty;
  bool singupValidate() =>
      mail.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confirmpasssword.text.isNotEmpty &&
      codeapp.text.isNotEmpty;

  AuthViewController._internal();
  factory AuthViewController() => singletton;

  static final AuthViewController singletton = AuthViewController._internal();
}
