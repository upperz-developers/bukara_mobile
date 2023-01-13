import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/Screens/auth/check_mail.dart';
import 'package:bukara/app/ui/Screens/auth/singup_page.dart';
import 'package:bukara/app/ui/screens/app_page.dart';
<<<<<<< HEAD
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
=======
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
>>>>>>> a8c7d62fa240bfe7918c8dc3501f2ef6a94d1afb
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/loginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TapGestureRecognizer? _signup;

  AppBloc? bloc;

  ValueNotifier<TextEditingController> email =
      ValueNotifier(TextEditingController());
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    bloc = AppBloc();

    _signup = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, SingUpPage.routeName);
      };
    super.initState();
  }

  bool loginSubmitted = false;

  bool get loginValidate =>
      email.value.text.isNotEmpty && password.text.isNotEmpty;

  void _submit() {
    if (loginValidate) {
      bloc!.add(
        LOGIN(
          email: email.value.text.trim(),
          password: password.text.trim(),
        ),
      );
      return;
    }
    setState(() {
      loginSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: ((context, state) {
          if (state is SUCCESS) {
            Navigator.pushReplacementNamed(context, AppPage.routeName);
          } else if (state is ERROR) {
            // errorModel(context, dueTo: state.dueTo!);
          }
        }),
        child: BlocBuilder<AppBloc, AppState>(
            bloc: bloc,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is LOADING,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(alignment: Alignment.center, child: icon()),
                            20.heightBox,
                            subtitle("Adresse mail"),
                            10.heightBox,
                            ValueListenableBuilder(
                                valueListenable: email,
                                builder: (context, TextEditingController email,
                                    child) {
                                  return FormText(
                                    controller: email,
                                    hint: "Entrez votre adresse mail",
                                    submitted: loginSubmitted,
                                  );
                                }),
                            // go check
                            20.heightBox,
                            subtitle("Mot de passe"),
                            10.heightBox,
                            FormPassWordText(
                              controller: password,
                              hint: "Entrez votre mot de passe",
                              submitted: loginSubmitted,
                            ),
                            10.heightBox,
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: (() {
                                  Navigator.pushNamed(
                                      context, Checkmail.routeName);
                                }),
                                child: const Text.rich(
                                  TextSpan(
                                      text: "Mot de passe oublié ?",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
=======
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AppBloc, AppState>(
          bloc: bloc,
          listener: ((context, state) {
            if (state is SUCCESS) {
              Navigator.pushReplacementNamed(context, AppPage.routeName);
            } else if (state is ERROR) {
              errorModel(context, dueTo: state.dueTo!.errors!);
            }
          }),
          child: BlocBuilder<AppBloc, AppState>(
              bloc: bloc,
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state is LOADING,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(alignment: Alignment.center, child: icon()),
                              20.heightBox,
                              subtitle("Adresse mail"),
                              10.heightBox,
                              ValueListenableBuilder(
                                  valueListenable: email,
                                  builder: (context,
                                      TextEditingController email, child) {
                                    return FormText(
                                      controller: email,
                                      hint: "Entrez votre adresse mail",
                                      submitted: loginSubmitted,
                                    );
                                  }),
                              // go check
                              20.heightBox,
                              subtitle("Mot de passe"),
                              10.heightBox,
                              FormPassWordText(
                                controller: password,
                                hint: "Entrez votre mot de passe",
                                submitted: loginSubmitted,
                              ),
                              10.heightBox,
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: (() {
                                    Navigator.pushNamed(
                                        context, Checkmail.routeName);
                                  }),
                                  child: const Text.rich(
                                    TextSpan(
                                        text: "Mot de passe oublié ?",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
>>>>>>> a8c7d62fa240bfe7918c8dc3501f2ef6a94d1afb
                                ),
                              ),
                            ),
                            30.heightBox,
                            custormButton(
                              context,
                              color: AppColors.BLACK_COLOR,
                              title: "Connexion",
                              colorText: Colors.white,
                              state: state,
                              onTap: _submit,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text.rich(
                        TextSpan(
                            text: "Vous n'avez pas un compte? ",
                            children: [
                              TextSpan(
                                  text: "creer un compte",
                                  recognizer: _signup,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
