import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/contrat/model.dart';
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
    Contrat contratData = ModalRoute.of(context)!.settings.arguments as Contrat;
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
                    Text.rich(
                      TextSpan(
                        text: "${contratData.amount}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: " ${contratData.currency} ${"par mois"}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "${contratData.appartement!.designation} - (${contratData.appartement!.features!.bedroom} chambres & ${contratData.appartement!.features!.livingroom} salon)",
                    ),
                    Text(
                      "${contratData.appartement!.typeAppartement!.designation} - ${contratData.appartement!.typeBien!.designation}",
                      style: const TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    30.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${contratData.landlord!.name} ${contratData.landlord!.lastname}",
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
                        Expanded(
                          child: Text(
                            "${contratData.user!.email}",
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
