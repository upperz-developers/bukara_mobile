import 'package:flutter/widgets.dart';

class AuthViewController {
  ValueNotifier<TextEditingController> email =
      ValueNotifier(TextEditingController());
  TextEditingController password = TextEditingController();
  TextEditingController confirmpasssword = TextEditingController();
  TextEditingController codeapp = TextEditingController();

  bool loginValidate() =>
      email.value.text.isNotEmpty && password.text.isNotEmpty;
  bool singupValidate() =>
      email.value.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confirmpasssword.text.isNotEmpty &&
      codeapp.text.isNotEmpty;

  AuthViewController._internal();
  factory AuthViewController() => singletton;

  static final AuthViewController singletton = AuthViewController._internal();
}
