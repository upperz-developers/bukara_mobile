import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/utils/widget.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class ChangePassword extends StatefulWidget {
  static String routeName = "/ChangePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  double longSpace = 40;
  double space = 20; // pour le grands espace
  double shortSpace = 10;

  TextEditingController? oldpassword = TextEditingController();
  TextEditingController? newpassword = TextEditingController();
  TextEditingController? confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    "Change your Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                52.widthBox,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    subtitle("your old password"),
                    10.heightBox,
                    FormPassWordText(
                      controller: oldpassword,
                      hint: "Entrez votre ancient mot de passe",
                    ),
                    20.heightBox,
                    subtitle("Configurez un nouveau mot de passe"),
                    10.heightBox,
                    FormPassWordText(
                      controller: newpassword,
                      hint: "Entrez mot de passe",
                    ),
                    10.heightBox,
                    FormPassWordText(
                      controller: confirmNewPassword,
                      hint: "Confirmez votre nouveau mot de passe",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: custormButton(
                context,
                color: AppColors.BLACK_COLOR,
                title: "Creation",
                colorText: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
