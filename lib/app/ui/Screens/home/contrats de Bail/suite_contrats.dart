import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.DISABLE_COLOR,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Iconsax.user,
                      size: 16,
                    ),
                  ),
                  5.widthBox,
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              10.heightBox,
              const Text(
                "Appartement de Lux",
              ),
              10.heightBox,
              const Text(
                "6 mois de Garantie",
                style: TextStyle(
                  fontSize: 16,
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
