//import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/screens/Recouvrement/detail_information_recouvrement.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/customer_date.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/utility.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../providers/recouvrenement/modele.dart';

class SuiteRecouvrement extends StatelessWidget {
  final ContratData? suiteRecouvrement;
  const SuiteRecouvrement({
    super.key,
    this.suiteRecouvrement,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.pushNamed(context, InfoRecouvrement.routeName,
                  arguments: suiteRecouvrement);
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 10,
                top: 15,
                bottom: 15,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "${dayLeft(
                        start: DateTime.now().toString(),
                        end: suiteRecouvrement!.dateRecovery!,
                      )} restants",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  15.heightBox,
                  Text(
                    "${suiteRecouvrement!.rentalContrat!.landlord!.name} ${suiteRecouvrement!.rentalContrat!.landlord!.lastname}",
                  ),
                  15.heightBox,
                  Text(
                    "${suiteRecouvrement!.rentalContrat!.appartement!.designation} - (${suiteRecouvrement!.rentalContrat!.appartement!.features!.bedroom} chambres & ${suiteRecouvrement!.rentalContrat!.appartement!.features!.livingroom} salon)",
                  ),
                  Text(
                    CustomDate(
                            date: DateTime.parse(
                                suiteRecouvrement!.rentalContrat!.startDate!))
                        .getFullDate,
                    style: const TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: HexColor.fromHex(suiteRecouvrement!.color!),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
