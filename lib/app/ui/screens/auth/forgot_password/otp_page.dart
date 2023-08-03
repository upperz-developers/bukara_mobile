import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../screens/auth/forgot_password/new_password.dart';

class Otp extends StatefulWidget {
  static String routeName = "/newpassword";
  const Otp({Key? key}) : super(key: key);
  @override
  State<Otp> createState() => _Otp();
}

class _Otp extends State<Otp> {
  TextEditingController? sendcode = TextEditingController();
  AppBloc? bloc;
  AppBloc? sendCodebloc;
  TapGestureRecognizer? _ressend;
  @override
  void initState() {
    bloc = AppBloc();
    sendCodebloc = AppBloc();
    _ressend = TapGestureRecognizer()
      ..onTap = () {
        bloc!.add(
          CHECKMAIL(
            email: email,
          ),
        );
      };
    super.initState();
  }

  _submit([String? optCode]) {
    sendCodebloc!.add(SENDCODE(
      email: email,
      code: optCode,
    ));
  }

  String? email;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: sendCodebloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pushNamed(context, Newpassword.routeName,
                arguments: email);
          }
          if (state is ERROR) {
            errorModel(context, dueTo: state.dueTo!.errors!);
          }
        },
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
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Vérification de votre e-mail",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.heightBox,
                    const Text(
                      "Nous vous enverrons un code dans votre boite mail merci de le saisir dans le champ",
                    ),
                    25.heightBox,
                    const Text("Entrez le code"),
                    20.heightBox,
                    PinCodeTextField(
                      errorTextSpace: 0,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      autoDismissKeyboard: false,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      controller: sendcode,
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.white,
                        selectedColor: Colors.black,
                        borderWidth: 1,
                        selectedFillColor: Colors.white,
                        inactiveColor: AppColors.GREY_COLOR.withOpacity(0.2),
                        activeColor: AppColors.GREY_COLOR.withOpacity(0.3),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                      ),
                      enableActiveFill: true,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      autoFocus: true,
                      onCompleted: (otpCode) {
                        _submit(otpCode);
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                    30.heightBox,
                    Text.rich(
                      TextSpan(
                        text: "Vous n'avez pas recu de code ? ",
                        children: [
                          TextSpan(
                            text: "Renvoyer",
                            recognizer: _ressend,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocListener<AppBloc, AppState>(
                      bloc: bloc,
                      listener: (context, state) {
                        if (state is ERROR) {
                          errorModel(context, dueTo: state.dueTo!.errors!);
                        }
                      },
                      child: BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          return state is LOADING
                              ? Column(
                                  children: [
                                    10.heightBox,
                                    Row(
                                      children: [
                                        const Text(
                                          "chargement",
                                          style: TextStyle(
                                            color: AppColors.BLACK_COLOR,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        10.widthBox,
                                        const SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            color: AppColors.BLACK_COLOR,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                    BlocBuilder(
                      bloc: sendCodebloc,
                      builder: (context, state) {
                        return state is LOADING
                            ? Column(
                                children: [
                                  10.heightBox,
                                  Row(
                                    children: [
                                      const Text(
                                        "chargement",
                                        style: TextStyle(
                                          color: AppColors.BLACK_COLOR,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      10.widthBox,
                                      const SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          color: AppColors.BLACK_COLOR,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
