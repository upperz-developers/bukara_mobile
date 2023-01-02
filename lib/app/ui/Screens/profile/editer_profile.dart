import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class EditerUser extends StatefulWidget {
  static String routeName = "/editerUser";
  const EditerUser({Key? key}) : super(key: key);

  @override
  State<EditerUser> createState() => _EditerUser();
}

class _EditerUser extends State<EditerUser> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();

    singupController.init();

    super.initState();
  }

  // bool singupSubmitted = false;
  // void _submit() {
  //   setState(() {
  //     singupSubmitted = true;
  //   });
  //   if (singupController.singupValidate()) {
  //     bloc!.add(
  //       SINGUP(
  //         email: singupController.email.value.text.trim(),
  //         password: singupController.password.text.trim(),
  //         confirmepassword: singupController.confirmpasssword.text.trim(),
  //       ),
  //     );
  //   }
  // }

  @override
  void dispose() {
    singupController.password = TextEditingController();
    super.dispose();
  }

  AuthViewController singupController = AuthViewController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              "Editer Profile",
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
                              horizontal: 30, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              subtitle("Adresse Mail"),
                              10.heightBox,
                              FormText(
                                controller: singupController.email.value,
                                hint: "nom@gmail.com",
                                //submitted: singupSubmitted,
                              ),
                              20.heightBox,
                              subtitle("Nom complet"),
                              10.heightBox,
                              FormText(
                                controller: singupController.password,
                                hint: "Entrez votre Nom",
                                //submitted: singupSubmitted,
                              ),
                              10.heightBox,
                              FormText(
                                controller: singupController.confirmpasssword,
                                hint: "Entrez votre Prenom",
                                //submitted: singupSubmitted,
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
                          title: "Editer",
                          colorText: Colors.white,
                          state: state,
                          //onTap: _submit,
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
