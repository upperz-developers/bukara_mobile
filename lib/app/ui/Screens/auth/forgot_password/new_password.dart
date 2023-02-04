import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/Screens/auth/login_page.dart';
import 'package:bukara/app/ui/Screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';

class Newpassword extends StatefulWidget {
  static String routeName = "/Newpassword";
  const Newpassword({Key? key}) : super(key: key);
  @override
  State<Newpassword> createState() => _Newpassword();
}

class _Newpassword extends State<Newpassword> {
  TextEditingController? password = TextEditingController();
  TextEditingController? confirmPassword = TextEditingController();
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  String? email;
  _submit() {
    bloc!.add(
      RESETPASSWORD(
        email: email,
        password: password!.text.trim(),
        confirmPassword: confirmPassword!.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.routeName, (route) => false);
          }
          if (state is ERROR) {
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
                            horizontal: 30, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Créer un nouveau mot de passe",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            20.heightBox,
                            const Text("Mots de passe"),
                            10.heightBox,
                            FormPassWordText(
                              controller: password,
                              hint: "Entrez votre mot de passe",
                            ),
                            10.heightBox,
                            FormPassWordText(
                              controller: confirmPassword,
                              hint: "Confirmez votre mot de passe",
                            ),
                            30.heightBox,
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
                        title: "Enrégistre",
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
