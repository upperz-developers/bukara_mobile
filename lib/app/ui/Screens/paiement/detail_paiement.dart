import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:table_calendar/table_calendar.dart';
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
    return SafeArea(
      child: Scaffold(
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
                      "${paiementData.contratData!.labelStr}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "${paiementData.amount} \$ par mois",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    line(),
                    Text(
                      "${paiementData.contratData!.rentalContrat!.landlord!.name} ${paiementData.contratData!.rentalContrat!.landlord!.lastname}",
                    ),
                    10.heightBox,
                    const Text(
                      "detail appartement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "${paiementData.contratData!.rentalContrat!.appartement!.typeAppartement!.designation} - ${paiementData.contratData!.rentalContrat!.appartement!.typeBien!.designation}",
                      style: const TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    10.heightBox,
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
                  Text(
                    "Date : ${CustomDate(date: DateTime.parse(paiementData.createdAt!)).getFullDate}",
                    style: const TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.heightBox,
                  if (paiementData.contratData!.rentalContrat!.user!.name !=
                      null)
                    Text(
                      "${paiementData.contratData!.rentalContrat!.user!.name} ${paiementData.contratData!.rentalContrat!.user!.lastname}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  5.heightBox,
                  Text(
                    "${paiementData.contratData!.rentalContrat!.user!.email}",
                  ),
                ],
              ),
            ),
          ],
        ),
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
