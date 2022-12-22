import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

import '../shared/utils/widget.dart';

class Profile extends StatefulWidget {
  static String routeName = "/infoprofile";
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  void _historique() {
    setState(() {
      setState(() {
        // Navigator.pushNamed(context, Historique.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.heightBox,
                const Text(
                  "@john doe",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.BLACK_COLOR,
                  ),
                ),
                10.heightBox,
                line(),
                cardPassWord(),
                10.heightBox,
                cardAbout(),
                400.heightBox,
                Center(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardPassWord() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Change password",
            style: TextStyle(color: Colors.black),
          ),
        ),
        IconButton(
            onPressed: _historique,
            icon: const Icon(
              Icons.arrow_forward_ios,
            ))
      ],
    );
  }

  Widget cardAbout() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "About App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        IconButton(
          onPressed: _historique,
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        )
      ],
    );
  }
}
