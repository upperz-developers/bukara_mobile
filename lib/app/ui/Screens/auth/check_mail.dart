import 'package:bukara/app/ui/Screens/auth/otp_page.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class Checkmail extends StatefulWidget {
  static String routeName = "/Checkmail";
  const Checkmail({Key? key}) : super(key: key);
  @override
  State<Checkmail> createState() => _Checkmail();
}

class _Checkmail extends State<Checkmail> {
  TextEditingController? email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
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
                horizontal: 24,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Récupération du compte",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.heightBox,
                  const Text(
                    "Pour récupérer vos données, veuillez saisir votre adresse e-mail.",
                  ),
                  25.heightBox,
                  const Text("Adresse Mail"),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: custormButton(
              context,
              color: AppColors.BLACK_COLOR,
              title: "next",
              colorText: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, Otp.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
