import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/Screens/profile/about_page.dart';
import 'package:bukara/app/ui/Screens/profile/change_password.dart';
import 'package:bukara/app/ui/screens/profile/logout.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  static String routeName = "/infoprofile";
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${getUserInfo().userName!}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                      10.heightBox,
                      line(),
                      cardPassWord(),
                      10.heightBox,
                      cardAbout(),
                      10.heightBox,
                      deconnexion(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text(
                      "BUKARA v1.0.0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
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
              45.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPassWord() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ChangePassword.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                "Change password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
            )
          ],
        ),
      ),
    );
  }

  Widget cardAbout() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AboutPage.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                "About App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }

  Widget deconnexion() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const Logout(),
          barrierDismissible: false,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: const [
            Expanded(
              child: Text(
                "Deconnexion",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
