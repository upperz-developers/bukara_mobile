import 'package:bukara/app/providers/recouvrenement/modele.dart';
import 'package:bukara/app/ui/screens/home/contrats%20de%20Bail/detail_contrats.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SuiteContrats extends StatelessWidget {
  final RentalContrat? suiteContrats;
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
                  children: const [
                    TextSpan(
                      text: "\$/mois",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " - 6 mois",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Text(
                "${suiteContrats!.appartement}",
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
