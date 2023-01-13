import 'package:bukara/app/ui/Screens/auth/login_page.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

class Newpassword extends StatefulWidget {
  static String routeName = "/Newpassword";
  const Newpassword({Key? key}) : super(key: key);
  @override
  State<Newpassword> createState() => _Newpassword();
}

class _Newpassword extends State<Newpassword> {
  TextEditingController? password = TextEditingController();
  TextEditingController? confirmPassword = TextEditingController();
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Create a new password",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  20.heightBox,
                  const Text("Mots de passe"),
                  10.heightBox,
                  FormPassWordText(
                    controller: password,
                    hint: "Entrez votre mot de passe",
                  ),
                  10.heightBox,
                  FormPassWordText(
                    controller: confirmPassword,
                    hint: "Confirmez votre mot de passe",
                  ),
                  30.heightBox,
                  custormButton(
                    context,
                    color: AppColors.BLACK_COLOR,
                    title: "Création",
                    colorText: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
