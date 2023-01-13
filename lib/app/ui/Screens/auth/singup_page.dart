import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class SingUpPage extends StatefulWidget {
  static String routeName = "/singUpPage";
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPage();
}

class _SingUpPage extends State<SingUpPage> {
  TapGestureRecognizer? _login;
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();

    singupController.init();
    _login = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    super.initState();
  }

  bool singupSubmitted = false;
  void _submit() {
    setState(() {
      singupSubmitted = true;
    });
    if (singupController.singupValidate) {
      bloc!.add(
        SINGUP(
          email: singupController.email.value.text.trim(),
          password: singupController.password.text.trim(),
          confirmepassword: singupController.confirmpasssword.text.trim(),
        ),
      );
    }
  }

  @override
  void dispose() {
    singupController.password = TextEditingController();
    super.dispose();
  }

  AuthViewController singupController = AuthViewController();
  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<AppBloc, AppState>(
            bloc: bloc,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is LOADING,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Iconsax.arrow_left,
                        ),
                        color: const Color.fromARGB(169, 32, 32, 32),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Creation du compte",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            34.heightBox,
                            subtitle("Adresse Mail"),
                            10.heightBox,
                            FormText(
                              controller: singupController.email.value,
                              hint: "nom@gmail.com",
                              submitted: singupSubmitted,
                            ),
                            20.heightBox,
                            subtitle("Mots de passe"),
                            10.heightBox,
                            FormPassWordText(
                              controller: singupController.password,
                              hint: "Entrez votre mot de passe",
                              submitted: singupSubmitted,
                            ),
                            10.heightBox,
                            FormPassWordText(
                              controller: singupController.confirmpasssword,
                              hint: "Confirmez votre mot de passe",
                              submitted: singupSubmitted,
                            ),
                            20.heightBox,
                            subtitle("Code application"),
                            10.heightBox,
                            FormText(
                              controller: singupController.codeapp,
                              hint: "Entrez votre code",
                              submitted: singupSubmitted,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      child: custormButton(
                        context,
                        color: AppColors.BLACK_COLOR,
                        title: "Creation",
                        colorText: Colors.white,
                        state: state,
                        onTap: _submit,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 30,
                          left: 30,
                          bottom: 30,
                        ),
                        child: Text.rich(
                          TextSpan(
                              text: "Vous avez deja un compte? ",
                              children: [
                                TextSpan(
                                    text: " se connecte",
                                    recognizer: _login,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
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
