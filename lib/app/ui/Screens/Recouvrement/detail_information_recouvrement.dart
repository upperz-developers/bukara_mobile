import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/recouvrenement/modele.dart';
import '../../shared/utils/widget.dart';

class InfoRecouvrement extends StatefulWidget {
  static String routeName = "/recouvrement";

  const InfoRecouvrement({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoRecouvrement> createState() => _InfoRecouvrement();
}

class _InfoRecouvrement extends State<InfoRecouvrement> {
  @override
  Widget build(BuildContext context) {
    ContratData suiteDetailRecouvrement =
        ModalRoute.of(context)!.settings.arguments as ContratData;
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${suiteDetailRecouvrement.rentalContrat!.landlord!.name} ${suiteDetailRecouvrement.rentalContrat!.landlord!.lastname}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    8.heightBox,
                    Text(
                      "${suiteDetailRecouvrement.rentalContrat!.landlord!.email}",
                      style: const TextStyle(
                        color: AppColors.BLACK_COLOR,
                      ),
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
