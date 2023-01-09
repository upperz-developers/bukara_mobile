import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:flutter/widgets.dart';

class AuthViewController {
  ValueNotifier<TextEditingController> email =
      ValueNotifier(TextEditingController());
  TextEditingController password = TextEditingController();
  TextEditingController confirmpasssword = TextEditingController();
  TextEditingController codeapp = TextEditingController();
  TextEditingController oldpassword = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  String codeCountry = "";
  TextEditingController phonenumber = TextEditingController();

  init() {
    password = TextEditingController();
    confirmpasssword = TextEditingController();
    codeapp = TextEditingController();
    oldpassword = TextEditingController();

    name = TextEditingController();
    lastname = TextEditingController();
    codeCountry = "+243";

    phonenumber = TextEditingController();
  }

  bool changepasswordValidation() =>
      oldpassword.value.text.isNotEmpty &&
      password.text.isNotEmpty &&
      confirmpasssword.text.isNotEmpty;

  void editerProfileSumbit(AppBloc bloc) {
    Map<String, dynamic> data = {
      "name": name.value.text.trim(),
      "lastname": lastname.text.trim(),
      "country_code": codeCountry,
      "phone_number": phonenumber.text.trim(),
      "email": getUserInfo().userPerfsInfo!.email,
    };

    bloc.add(
      EDITERUSER(
        data: data,
      ),
    );
  }

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
