import 'package:bukara/app/ui/auth/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Screens/home/home_page.dart';
import '../shared/utils/utility.dart';
import '../shared/style.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

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
                      "Checking your email",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.heightBox,
                    const Text(
                      "We will send you a code in your mailbox please enter it in the field",
                    ),
                    25.heightBox,
                    subtitle("Enter your code"),
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
                      onChanged: (value) {
                        // setState(() {
                        //   hasCompleted = value.isNotEmpty;
                        //   _currentValue = value;
                        // });
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                    30.heightBox,
                    const Text.rich(
                      TextSpan(
                          text: "Vous n'avez pas recu de code ? ",
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
