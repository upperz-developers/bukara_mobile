import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/Screens/auth/check_mail.dart';
import 'package:bukara/app/ui/Screens/auth/singup_page.dart';
import 'package:bukara/app/ui/Screens/home/app_page.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
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

  AuthViewController loginController = AuthViewController();
  void _submit() {
    setState(() {
      loginSubmitted = true;
    });
    if (loginController.loginValidate()) {
      bloc!.add(
        LOGIN(
          email: loginController.email.value.text.trim(),
          password: loginController.password.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AppBloc, AppState>(
          bloc: bloc,
          listener: ((context, state) {
            if (state is SUCCESS) {
              Navigator.pushReplacementNamed(context, AppPage.routeName);
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
                              subtitle("Username"),
                              10.heightBox,
                              ValueListenableBuilder(
                                  valueListenable: loginController.email,
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
                              subtitle("Password"),
                              10.heightBox,
                              FormPassWordText(
                                controller: loginController.password,
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
                                        text: "Forgot password?",
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
                                title: "Login",
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
      ),
    );
  }
}
