import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/Screens/historique_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';

import '../shared/utils/widget.dart';

class InfoProfile extends StatefulWidget {
  static String routeName = "/profile";
  const InfoProfile({Key? key}) : super(key: key);

  @override
  State<InfoProfile> createState() => _InfoProfile();
}

class _InfoProfile extends State<InfoProfile> {
  void _returnDetail() {
    setState(() {
      Navigator.pushNamed(context, Details.routeName);
    });
  }

  void _returnprofile() {
    setState(() {
      setState(() {
        //Navigator.pushNamed(context, InfoProfile.routeName);
      });
    });
  }

  void _historique() {
    setState(() {
      setState(() {
        Navigator.pushNamed(context, Historique.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: _returnDetail,
              icon: const Icon(
                Iconsax.arrow_left_2,
              ),
              color: const Color.fromARGB(169, 32, 32, 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "John doe",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      "physical person",
                      style: TextStyle(
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                    30.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Iconsax.home),
                        15.widthBox,
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Name of suite",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                                  style: TextStyle(
                                    color: AppColors.SECOND_TEXT_COLOR,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: _historique,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.activity,
                            ),
                            15.widthBox,
                            const Expanded(
                              child: Text(
                                "Historic of paiement",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                            15.widthBox,
                            const Icon(
                              Iconsax.arrow_right_3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.heightBox,
                    line(),
                    15.heightBox,
                    const Text(
                      "About tenant",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    25.heightBox,
                    module(Iconsax.document, "4 persons"),
                    module(Iconsax.home, "Maried"),
                    module2(Iconsax.tag, "Last Addres",
                        "Goma, C de Goma, Q les volcan,\nav des avenues, num 10"),
                    module(Iconsax.wallet_check, "Congolese"),
                    moduleIsEntreprise(Iconsax.shapes4, "Is entriprise"),
                    module2(Iconsax.tag, "2218096730973", "Passport"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moduleIsEntreprise(
    IconData? icon,
    String? message,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon),
          15.widthBox,
          Expanded(
            child: Text(
              "$message",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
          120.widthBox,
          // const Spacer(),
          Container(
            height: 35,
            width: 60,
            decoration: BoxDecoration(
                color: AppColors.DISABLE_COLOR,
                borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text("Yes")),
          )
        ],
      ),
    );
  }

  Widget module(
    IconData? icon,
    String? message,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon),
          15.widthBox,
          Expanded(
            child: Text(
              "$message",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget module2(IconData? icon, String? title, String? message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          15.widthBox,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "$title",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              "$message",
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 161, 161, 161)),
            ),
          ]),
        ],
      ),
    );
  }

  Widget modulePassport() {
    return Container(
      color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const Icon(Icons.backpack_rounded)),
          Column(children: const [
            Padding(
              padding: EdgeInsets.only(right: 230),
              child: Text(
                "2218096730973",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                // textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 280),
              child: Text(
                "Passport",
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 58, 57, 57)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
