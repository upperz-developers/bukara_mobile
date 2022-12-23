import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/Screens/auth/check_mail.dart';
import 'package:bukara/app/ui/Screens/auth/singup_page.dart';
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

  @override
  void initState() {
    _signup = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, SingUpPage.routeName);
      };
    super.initState();
  }

  bool loginSubmitted = false;

  void _submit() {
    setState(() {
      loginSubmitted = true;
    });
    if (loginController.loginValidate()) {
      context.read<AppBloc>().add(
            LOGIN(
              email: loginController.mail.text.trim(),
              password: loginController.password.text.trim(),
            ),
          );
    }
  }

  AuthViewController loginController = AuthViewController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    FormText(
                      controller: loginController.mail,
                      submitted: loginSubmitted,
                      hint: "Entrez votre adresse mail",
                    ),
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
                          Navigator.pushNamed(context, Checkmail.routeName);
                        }),
                        child: const Text.rich(
                          TextSpan(
                              text: "Forgot password?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                        ),
                      ),
                    ),
                    30.heightBox,
                    BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                      return custormButton(
                        context,
                        color: AppColors.BLACK_COLOR,
                        title: "Login",
                        colorText: Colors.white,
                        state: state,
                        onTap: _submit,
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text.rich(
                TextSpan(text: "Vous n'avez pas un compte? ", children: [
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
      ),
    );
  }
}
