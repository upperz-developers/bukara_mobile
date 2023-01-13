import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class Otp extends StatefulWidget {
  static String routeName = "/newpassword";
  const Otp({Key? key}) : super(key: key);
  @override
  State<Otp> createState() => _Otp();
}

class _Otp extends State<Otp> {
  TextEditingController? sendcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    const Text("Enter your code"),
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
                      onCompleted: (otpCode) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                    30.heightBox,
                    const Text.rich(
                      TextSpan(
                          text: "Vous n'avez pas reçu le code ? ",
                          children: [
                            TextSpan(
                              text: "Renvoyer",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
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
