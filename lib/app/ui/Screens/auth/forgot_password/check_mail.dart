import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/screens/auth/forgot_password/otp_page.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  static String routeName = "/forgotPassword";
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    checkmailController.init();
    super.initState();
  }

  bool checkmailSubmitted = false;
  void _submit() {
    if (checkmailController.CheckmailValidation) {
      bloc!.add(
        CHECKMAIL(
          email: checkmailController.email.value.text.trim(),
        ),
      );
      return;
    }
    setState(() {
      checkmailSubmitted = true;
    });
  }

  AuthViewController checkmailController = AuthViewController();
  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pushNamed(context, Otp.routeName,
                arguments: checkmailController.checkmail.value.text);
          } else if (state is ERROR) {
            errorModel(context, dueTo: state.dueTo!.errors!);
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
                          horizontal: 24,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Récupération du compte",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            10.heightBox,
                            const Text(
                              "Pour récupérer vos données, veuillez saisir votre adresse e-mail.",
                            ),
                            25.heightBox,
                            const Text("Adresse Mail"),
                            10.heightBox,
                            FormText(
                              controller: checkmailController.email.value,
                              hint: "nom@gmail.com",
                              submitted: checkmailSubmitted,
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
                        title: "suivant",
                        colorText: Colors.white,
                        state: state,
                        onTap: _submit,
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
