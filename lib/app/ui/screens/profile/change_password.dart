import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/screens/auth/login_page.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../shared/utils/widget.dart';
import '../../view_controller/auth_controller.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = "/ChangePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    changepasswordController.init();
    super.initState();
  }

  bool changepasswordSubmitted = false;
  void _submit() {
    setState(() {
      changepasswordSubmitted = true;
    });
    if (changepasswordController.changepasswordValidation) {
      bloc!.add(
        CHANGEPASSWORD(
          oldpassword: changepasswordController.oldpassword.value.text.trim(),
          newpassword: changepasswordController.password.text.trim(),
          confirmepassword:
              changepasswordController.confirmpasssword.text.trim(),
        ),
      );
    }
  }

  AuthViewController changepasswordController = AuthViewController();
  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            AppPref.prefs!.clear();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.routeName, (route) => false);
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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Iconsax.arrow_left,
                          ),
                          color: const Color.fromARGB(169, 32, 32, 32),
                        ),
                        const Expanded(
                          child: Text(
                            "Changer mots de Passe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        52.widthBox,
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Ancien mote de passe"),
                            10.heightBox,
                            FormPassWordText(
                              controller: changepasswordController.oldpassword,
                              hint: "Entrez votre mot de passe",
                              submitted: changepasswordSubmitted,
                            ),
                            20.heightBox,
                            const Text("Configurez le mot de passe"),
                            10.heightBox,
                            FormPassWordText(
                              controller: changepasswordController.password,
                              hint: "Entrez votre le mot de passe",
                              submitted: changepasswordSubmitted,
                            ),
                            10.heightBox,
                            FormPassWordText(
                              controller:
                                  changepasswordController.confirmpasssword,
                              hint: "Confirmez le mot de passe",
                              submitted: changepasswordSubmitted,
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
                        title: "Changer mots de passe",
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
