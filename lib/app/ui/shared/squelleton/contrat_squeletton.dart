import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class ContratSqueletton extends StatelessWidget {
  const ContratSqueletton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer(
                  color: Colors.grey.withAlpha(10),
                  child: Container(
                    height: 10,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.DISABLE_COLOR,
                    ),
                  ),
                ),
                5.heightBox,
                Shimmer(
                  color: Colors.grey.withAlpha(10),
                  child: Container(
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.DISABLE_COLOR,
                    ),
                  ),
                ),
                15.heightBox,
                Shimmer(
                  color: Colors.grey.withAlpha(10),
                  child: Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.DISABLE_COLOR,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.widthBox,
          Shimmer(
            color: Colors.grey.withAlpha(10),
            child: Container(
              height: 20,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.DISABLE_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
