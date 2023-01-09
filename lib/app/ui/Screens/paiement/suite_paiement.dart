import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../providers/paiement_modele/modele.dart';

class SuitePaiement extends StatelessWidget {
  final PayementHistoric? suitePaiement;

  const SuitePaiement({
    Key? key,
    this.suitePaiement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          /// Navigating to a new page.
          // Navigator.pushNamed(context, InfoLocataire.routeName,
          //     arguments: suiteNotification);
        },
        child: Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "${suitePaiement!.contratData!.labelStr} ",
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "${suitePaiement!.contratData!.rentalContrat!.landlord!.name} ${suitePaiement!.contratData!.rentalContrat!.landlord!.lastname!}",
              style: const TextStyle(color: AppColors.SECOND_TEXT_COLOR),
            ),
            10.heightBox,
            Text(
              "${suitePaiement!.amount}\$",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            10.heightBox,
            Text(
              "${suitePaiement!.createdAt}",
            ),
          ]),
        ),
      ),
    );
  }
}
