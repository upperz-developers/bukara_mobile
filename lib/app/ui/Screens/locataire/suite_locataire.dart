//import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/screens/locataire/detail_information_locataire.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
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
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.pushNamed(context, InfoLocataire.routeName,
            arguments: suiteNotification);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${suiteNotification!.name!} ${suiteNotification!.lastname!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    5.heightBox,
                    Text(
                      "${suiteNotification!.phones![0].countryCode} (0) ${suiteNotification!.phones![0].number}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.SECOND_TEXT_COLOR,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              15.widthBox,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          15.heightBox,
          Text(
            "${suiteNotification!.lastAdress}",
          ),
          line(),
        ],
      ),
    );
  }
}
