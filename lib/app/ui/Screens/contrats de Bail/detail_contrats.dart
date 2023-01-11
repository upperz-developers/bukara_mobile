import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';

import '../../shared/utils/widget.dart';

class DetailContrat extends StatefulWidget {
  static String routeName = "/detailContrat";

  const DetailContrat({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailContrat> createState() => _DetailContrat();
}

class _DetailContrat extends State<DetailContrat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    const Text(
                      "29 jours restants",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "Du janvier",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    15.heightBox,
                    const Text.rich(
                      TextSpan(
                        text: "450",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: " USD par mois",
                            style: TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: line(),
                    ),
                    const Text(
                      "Appartement de Lux - (4 chambres & 2 salons)",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    20.heightBox,
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
