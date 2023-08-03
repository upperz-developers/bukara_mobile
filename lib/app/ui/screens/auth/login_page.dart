import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/screens/app_page.dart';
import 'package:bukara/app/ui/screens/auth/forgot_password/check_mail.dart';
import 'package:bukara/app/ui/screens/auth/singup_page.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
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
    return CustormScaffold(
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
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 25),
                                  height: 140,
                                  width: 140,
                                  decoration: const BoxDecoration(
                                    color: AppColors.DISABLE_COLOR,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icons/icon.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            20.heightBox,
                            const Text("Adresse mail"),
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
                            const Text("Mot de passe"),
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
                                      context, ForgotPassword.routeName);
                                }),
                                child: const Text.rich(
                                  TextSpan(
                                      text: "Mot de passe oublié ?",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
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
