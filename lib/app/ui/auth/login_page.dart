import 'package:bukara/app/ui/auth/new_password.dart';
import 'package:bukara/app/ui/auth/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/Screens/app_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../shared/utils/utility.dart';
import '../shared/style.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class LoginPage extends StatefulWidget {
  static String routeName = "/loginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController? password = TextEditingController();
  bool isObscure = true;
  TextEditingController? username = TextEditingController();
  TextEditingController? email = TextEditingController();

  void _updatepass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void _checkmail() {
    setState(() {
      setState(() {
        Navigator.pushNamed(context, Newpassword.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              130.heightBox,
              icon(),
              20.heightBox,
              subtitle("Username"),
              10.heightBox,
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.BOXSHADOW)),
                child: TextField(
                  controller: username,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.BOXSHADOW,
                      ),
                    ),
                    hintText: "Enter your username",
                    hintStyle: TextStyle(
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                ),
              ),
              20.heightBox,
              subtitle("Password"),
              10.heightBox,
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.BOXSHADOW)),
                child: TextField(
                  controller: password,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    suffixIcon: IconButton(
                      color: const Color.fromARGB(255, 127, 150, 171),
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                        size: 18,
                        color: AppColors.BLACK_COLOR,
                      ),
                      onPressed: _updatepass,
                    ),
                    hintText: "mot de passe",
                    hintStyle: const TextStyle(
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                ),
              ),
              10.heightBox,
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: _checkmail,
                  child: const Text.rich(
                    TextSpan(
                        text: "Mots de passe oublie?",
                        style: TextStyle(decoration: TextDecoration.underline)),
                  ),
                ),
              ),
              30.heightBox,
              custormButton(
                context,
                color: AppColors.BLACK_COLOR,
                title: "Connexion",
                colorText: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, AppPage.routeName);
                },
              ),
              15.heightBox,
              custormButton(
                context,
                color: AppColors.BLACK_COLOR,
                title: "Creation du compte",
                colorText: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, SingUpPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
