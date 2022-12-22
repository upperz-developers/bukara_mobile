import 'package:bukara/app/ui/auth/new_password.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.BOXSHADOW)),
                      child: TextField(
                        controller: sendcode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.BOXSHADOW,
                            ),
                          ),
                          hintText: "Confirmation code",
                          hintStyle: TextStyle(
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    30.heightBox,
                    custormButton(
                      context,
                      color: AppColors.BLACK_COLOR,
                      title: "Send",
                      colorText: Colors.white,
                      onTap: () {
                        Navigator.pushNamed(context, Newpassword.routeName);
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
