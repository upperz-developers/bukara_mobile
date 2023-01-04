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
              const Text(
                "Appartement de Lux",
              ),
              10.heightBox,
              const Text.rich(
                TextSpan(
                  text: "370",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: "\$ par mois",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              const Text(
                "Garantie de 6 mois",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              15.heightBox,
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "John Doe",
                    ),
                  ),
                  20.widthBox,
                  const Text(
                    "Locataire",
                    style: TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
