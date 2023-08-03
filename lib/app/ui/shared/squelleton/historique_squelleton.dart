import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class HistoriqueSquelleton extends StatelessWidget {
  const HistoriqueSquelleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Iconsax.arrow_left,
              ),
              color: const Color.fromARGB(169, 32, 32, 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Historique Paiement",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer(
                                    color: Colors.grey.withAlpha(10),
                                    child: Container(
                                      height: 70,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.DISABLE_COLOR,
                                      ),
                                    ),
                                  ),
                                  15.heightBox,
                                  Shimmer(
                                    color: Colors.grey.withAlpha(10),
                                    child: Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.DISABLE_COLOR,
                                      ),
                                    ),
                                  ),
                                  15.heightBox,
                                  Shimmer(
                                    color: Colors.grey.withAlpha(10),
                                    child: Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.DISABLE_COLOR,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              height: 10,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.DISABLE_COLOR,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
