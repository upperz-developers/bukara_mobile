import 'package:bukara/app/ui/Screens/contrats_de_bail/detail_contrats.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../providers/contrat/model.dart';

class SuiteContrats extends StatelessWidget {
  final Contrat? suiteContrats;
  const SuiteContrats({
    super.key,
    this.suiteContrats,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushNamed(context, DetailContrat.routeName,
              arguments: suiteContrats);
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
            color: AppColors.DISABLE_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "${suiteContrats!.amount}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: " ${suiteContrats!.currency} ${"/mois"}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Text(
                "${suiteContrats!.appartement!.designation} - ${suiteContrats!.appartement!.features!.bedroom} chambres & ${suiteContrats!.appartement!.features!.livingroom} salon)",
              ),
              15.heightBox,
              Text(
                "${suiteContrats!.landlord!.name} ${suiteContrats!.landlord!.lastname}",
                style: const TextStyle(
                  color: AppColors.SECOND_TEXT_COLOR,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
