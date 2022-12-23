import 'package:bukara/app/ui/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../shared/style.dart';
import '../../shared/utils/utility.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class SingUpPage extends StatefulWidget {
  static String routeName = "/singUpPage";
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPage();
}

class _SingUpPage extends State<SingUpPage> {
  double longSpace = 40;
  double space = 20; // pour le grands espace
  double shortSpace = 10;

  TextEditingController? password = TextEditingController();
  TextEditingController? confirmPassword = TextEditingController();
  bool isObscure = true;
  bool isPassObscure = true;
  TextEditingController? username = TextEditingController();
  TextEditingController? email = TextEditingController();

  void _updatepass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void _updatepassconfirm() {
    setState(() {
      isPassObscure = !isPassObscure;
    });
  }

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Ceattion du compte",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    20.heightBox,
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
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                    20.heightBox,
                    subtitle("Confirme your Password"),
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.BOXSHADOW)),
                      child: TextField(
                        controller: confirmPassword,
                        obscureText: isPassObscure,
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
                              isPassObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 18,
                              color: AppColors.BLACK_COLOR,
                            ),
                            onPressed: _updatepassconfirm,
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
                    30.heightBox,
                    custormButton(
                      context,
                      color: AppColors.BLACK_COLOR,
                      title: "Creation",
                      colorText: Colors.white,
                      onTap: () {
                        Navigator.pushNamed(context, Home.routeName);
                      },
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
