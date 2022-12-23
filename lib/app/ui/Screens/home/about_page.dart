import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController {
  AuthController._internal();
  static final singleton = AuthController._internal();
  factory AuthController() => singleton;
}

class AboutPage extends StatefulWidget {
  static String routeName = "/AboutPage";
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
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
                child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "BUKARA v1.0.0",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.heightBox,
                    const Text(
                      "Builid by Devinna in partenship with\n Upperz",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
