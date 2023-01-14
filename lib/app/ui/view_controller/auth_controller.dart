// ignore_for_file: non_constant_identifier_names

import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
import 'package:flutter/widgets.dart';

class AuthViewController {
  ValueNotifier<TextEditingController> email =
      ValueNotifier(TextEditingController());
  TextEditingController password = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController checkmail = TextEditingController();
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
    checkmail = TextEditingController();
    name = TextEditingController();
    lastname = TextEditingController();
    codeCountry = "+243";

    phonenumber = TextEditingController();
  }

  bool get CheckmailValidation => checkmail.value.text.isNotEmpty;

  bool get changepasswordValidation =>
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

  bool singupValidate(BuildContext context) {
    if (codeapp.text.isEmpty || codeapp.text.trim() != "UpperzApp#432") {
      ErrorModel error = ErrorModel();
      error.errors!.add(ErrorData(
          field: "Code Application",
          message: "Le code application est incorrect"));
      errorModel(context, dueTo: error.errors!);
      return false;
    }
    return email.value.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmpasssword.text.isNotEmpty;
  }

  bool get forgotValidate => email.value.text.isNotEmpty;
}
