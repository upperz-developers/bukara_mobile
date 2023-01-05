import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';

import '../../../shared/utils/widget.dart';

class InfoRecouvrement extends StatefulWidget {
  static String routeName = "/inforecouvrement";

  const InfoRecouvrement({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoRecouvrement> createState() => _InfoRecouvrement();
}

class _InfoRecouvrement extends State<InfoRecouvrement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// A widget that is used to display an icon.

            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Iconsax.arrow_left,
              ),
              color: const Color.fromARGB(169, 32, 32, 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: "",
                            style: TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.heightBox,
                    const Text.rich(
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: " USD par mois",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.heightBox,
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "John Doe",
                          ),
                        ),
                        20.widthBox,
                        const Text(
                          "Locataire",
                          style: TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Upperz",
                          ),
                        ),
                        15.widthBox,
                        const Text(
                          "Signateur",
                          style: TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    30.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.activity,
                        ),
                        15.widthBox,
                        const Expanded(
                          child: Text(
                            "Historic of paiement pour ce recouvrement",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: line(),
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
