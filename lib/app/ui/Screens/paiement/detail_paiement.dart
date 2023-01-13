import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/paiement_modele/modele.dart';
import '../../shared/utils/utility_fonction/customer_date.dart';
import '../../shared/utils/widget.dart';

class DetailPaiement extends StatefulWidget {
  static String routeName = "/detailpaiement";
  const DetailPaiement({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPaiement> createState() => _DetailPaiement();
}

class _DetailPaiement extends State<DetailPaiement> {
  @override
  Widget build(BuildContext context) {
    PayementHistoric paiementData =
        ModalRoute.of(context)!.settings.arguments as PayementHistoric;
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
                  "Detail paiement",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              52.widthBox,
            ],
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
                  Text(
                    "${paiementData.amount}\$",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.heightBox,
                  Text(
                    "${paiementData.contratData!.labelStr}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  line(),
                  Text(
                    "${paiementData.contratData!.rentalContrat!.landlord!.name} ${paiementData.contratData!.rentalContrat!.landlord!.lastname}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  10.heightBox,
                  Text(
                    "${paiementData.contratData!.rentalContrat!.appartement!.designation}",
                    style: const TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  15.heightBox,
                  Text(
                    "${paiementData.contratData!.rentalContrat!.appartement!.description}",
                    style: const TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                    ),
                  ),
                  20.heightBox,
                  caracteristic(paiementData),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                line(),
                const Text(
                  "Paiement effectué par:",
                ),
                20.heightBox,
                if (paiementData.contratData!.rentalContrat!.user!.name != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${paiementData.contratData!.rentalContrat!.user!.name} ${paiementData.contratData!.rentalContrat!.user!.lastname}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                Text(
                  "${paiementData.contratData!.rentalContrat!.user!.email}",
                ),
                20.heightBox,
                Text(
                  "Payé : ${CustomDate(date: DateTime.parse(paiementData.createdAt!)).getFullDate}",
                  style: const TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget caracteristic(PayementHistoric suitepaiement) {
    return Column(
      children: [
        caracteristicModel(
          title:
              "${suitepaiement.contratData!.rentalContrat!.appartement!.features!.bedroom} chambres",
          icon: Iconsax.box,
        ),
        caracteristicModel(
          title:
              "${suitepaiement.contratData!.rentalContrat!.appartement!.features!.livingroom} salons",
          icon: Iconsax.home,
        ),
        caracteristicModel(
          title:
              "${suitepaiement.contratData!.rentalContrat!.appartement!.features!.interntoilet} toillette interne",
          icon: Iconsax.safe_home,
        ),
        caracteristicModel(
          title:
              "${suitepaiement.contratData!.rentalContrat!.appartement!.features!.externtoilet} toillette externe",
          icon: Iconsax.activity,
        ),
      ],
    );
  }
}
