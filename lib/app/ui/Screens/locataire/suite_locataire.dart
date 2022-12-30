//import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${suiteNotification!.name!}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //5.heightBox,

                Column(
                    children: List.generate(
                  suiteNotification!.phones!.length,
                  (index) => Text(
                    "(0) ${suiteNotification!.phones![index].number}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )),

                15.heightBox,
                Text(
                  " ${suiteNotification!.email!}",
                ),
                5.heightBox,
                const Text(
                  "adresse",
                  style: TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontSize: 12,
                  ),
                ),
                15.heightBox,
                Text(
                  "souscrit le ${suiteNotification!.createdAt!}",
                  style: const TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontSize: 12,
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
