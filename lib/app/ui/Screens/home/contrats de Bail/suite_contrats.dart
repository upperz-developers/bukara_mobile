import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SuiteContrats extends StatelessWidget {
  const SuiteContrats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          //Navigator.pushNamed(context, InfoRecouvrement.routeName,
          //arguments: suiteRecouvrement);
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
              const Text.rich(
                TextSpan(
                  text: "370",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: [
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
              const Text(
                "Appartement de Lux",
              ),
              15.heightBox,
              const Text(
                "John Doe",
                style: TextStyle(
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
