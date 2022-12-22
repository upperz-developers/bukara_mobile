import 'package:bukara/app/ui/auth/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../shared/utils/utility.dart';
import '../shared/style.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class Newpassword extends StatefulWidget {
  static String routeName = "/newpassword";
  const Newpassword({Key? key}) : super(key: key);

  @override
  State<Newpassword> createState() => _Newpassword();
}

class _Newpassword extends State<Newpassword> {
  TextEditingController? email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Account Recovery",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.heightBox,
                const Text(
                  "To retrieve your data, please enter your email address.",
                ),
                25.heightBox,
                subtitle("Adresse Mail"),
                10.heightBox,
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.BOXSHADOW)),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.BOXSHADOW,
                        ),
                      ),
                      hintText: "nom@gmail.com",
                      hintStyle: TextStyle(
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                30.heightBox,
                custormButton(
                  context,
                  color: AppColors.BLACK_COLOR,
                  title: "suivant",
                  colorText: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, Otp.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
