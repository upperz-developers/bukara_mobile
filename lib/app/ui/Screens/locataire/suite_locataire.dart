//import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../providers/tennant/modele.dart';

class SuiteLocataire extends StatelessWidget {
  final TenantModel? suiteNotification;

  const SuiteLocataire({
    Key? key,
    this.suiteNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(
              15,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text:
                              "${suiteNotification!.name!} ${suiteNotification!.lastname!}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            const TextSpan(
                              text: " - ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${suiteNotification!.phones![0].countryCode} (0) ${suiteNotification!.phones![0].number}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.SECOND_TEXT_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      5.heightBox,
                      Text(
                        "${suiteNotification!.landlordType}",
                        style: const TextStyle(
                          color: AppColors.SECOND_TEXT_COLOR,
                          fontSize: 12,
                        ),
                      ),
                      10.heightBox,
                      Text(
                        "${suiteNotification!.lastAdress}",
                        style: const TextStyle(
                          color: AppColors.SECOND_TEXT_COLOR,
                          fontSize: 12,
                        ),
                      ),
                      10.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.DISABLE_COLOR,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "${suiteNotification!.maritalStatus}",
                          style: const TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   " ${suiteNotification!.name!}",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 //5.heightBox,

//                 Column(
//                     children: List.generate(
//                   suiteNotification!.phones!.length,
//                   (index) => Text(
//                     "${suiteNotification!.phones![0].countryCode} (0) ${suiteNotification!.phones![index].number}",
//                     style: const TextStyle(
//                       fontSize: 12,
//                     ),
//                   ),
//                 )),

//                 15.heightBox,
//                 Text(
//                   " ${suiteNotification!.landlordtype!}",
//                 ),
//                 5.heightBox,
//                 Text(
//                   suiteNotification!.lastadress!,
//                   style: const TextStyle(
//                     color: AppColors.SECOND_TEXT_COLOR,
//                     fontSize: 12,
//                   ),
//                 ),
//                 15.heightBox,
//                 Text(
//                   "souscrit le ${suiteNotification!.createdAt!}",
//                   style: const TextStyle(
//                     color: AppColors.SECOND_TEXT_COLOR,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),