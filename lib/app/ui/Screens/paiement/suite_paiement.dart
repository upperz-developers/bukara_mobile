import 'package:bukara/app/ui/screens/paiement/detail_paiement.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/customer_date.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../providers/paiement_modele/modele.dart';
import '../../shared/utils/widget.dart';

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
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          /// Navigating to a new page.
          Navigator.pushNamed(context, DetailPaiement.routeName,
              arguments: suitePaiement);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.TRANSPARENT,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${suitePaiement!.contratData!.labelStr} ",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.heightBox,
                        Text(
                          "${suitePaiement!.contratData!.rentalContrat!.landlord!.name} ${suitePaiement!.contratData!.rentalContrat!.landlord!.lastname!}",
                          style: const TextStyle(),
                        ),
                        10.heightBox,
                        Text(
                          "Du ${CustomDate(date: DateTime.parse(suitePaiement!.createdAt!)).getFullDate}",
                          style: const TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.widthBox,
                  Text(
                    "${suitePaiement!.amount}\$",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                ],
              ),
              line(),
            ],
          ),
        ),
      ),
    );
  }
}
