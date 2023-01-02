//import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/utility%20fonction/utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              // Navigator.pushNamed(context, InfoLocataire.routeName,
              //     arguments: suiteNotification);
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 10,
                top: 10,
                bottom: 10,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.DISABLE_COLOR,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.user,
                          size: 20,
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${suiteRecouvrement!.rentalContrat!.landlord!.name} ${suiteRecouvrement!.rentalContrat!.landlord!.lastname}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              3.heightBox,
                              Text(
                                "${suiteRecouvrement!.rentalContrat!.landlord!.email}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 161, 161, 161),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  15.heightBox,
                  Text(
                    "${suiteRecouvrement!.labelStr}",
                  ),
                  15.heightBox,
                  Text.rich(
                    TextSpan(
                      text: dayLeft(
                          start: suiteRecouvrement!.rentalContrat!.startDate!,
                          end: suiteRecouvrement!.dateRecovery!),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: " - ${suiteRecouvrement!.labelMonth}",
                          style: const TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
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
              decoration: const BoxDecoration(
                color: Color.fromARGB(115, 185, 185, 185),
                borderRadius: BorderRadius.only(
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
