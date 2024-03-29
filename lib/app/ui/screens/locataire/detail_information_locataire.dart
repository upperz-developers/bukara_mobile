import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/tennant/modele.dart';
import '../../shared/utils/widget.dart';

class InfoLocataire extends StatefulWidget {
  static String routeName = "/locataire";
  const InfoLocataire({
    Key? key,
  }) : super(key: key);
  @override
  State<InfoLocataire> createState() => _InfoLocataire();
}

class _InfoLocataire extends State<InfoLocataire> {
  @override
  Widget build(BuildContext context) {
    TenantModel suiteDetailLocataire =
        ModalRoute.of(context)!.settings.arguments as TenantModel;
    return CustormScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Iconsax.arrow_left,
                ),
                color: const Color.fromARGB(169, 32, 32, 32),
              ),
              const Expanded(
                child: Text(
                  "Détail locataire",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              52.widthBox,
            ],
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
                    "${suiteDetailLocataire.name!} ${suiteDetailLocataire.lastname!}",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  8.heightBox,
                  Text(
                    "${suiteDetailLocataire.landlordType}",
                    style: const TextStyle(
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                  line(),
                  const Text(
                    "Appropos du locataire",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  30.heightBox,
                  module(Iconsax.call,
                      "${suiteDetailLocataire.phones![0].countryCode} (0) ${suiteDetailLocataire.phones![0].number}"),
                  module(Iconsax.message, "${suiteDetailLocataire.email}"),
                  module(Iconsax.home, "${suiteDetailLocataire.maritalStatus}"),
                  module2(Iconsax.tag, "Dernière adresse",
                      "${suiteDetailLocataire.lastAdress}"),
                  module(Iconsax.wallet_check,
                      "${suiteDetailLocataire.nationality}"),
                  if (suiteDetailLocataire.landlordType != 'personne physique')
                    moduleIsEntreprise(Iconsax.shapes4, "c'est une entreprise"),
                  module2(Iconsax.tag, "${suiteDetailLocataire.cardTypeId}",
                      "${suiteDetailLocataire.cardType}"),
                ],
              ),
            ),
          ),
        ],
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
                color: Colors.black,
              ),
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
          Expanded(
            child:
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
          ),
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
          const Column(children: [
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
