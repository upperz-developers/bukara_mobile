import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationSquelleton extends StatelessWidget {
  const NotificationSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Shimmer(
        color: Colors.grey.withAlpha(10),
        child: Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.DISABLE_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 227, 227),
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              10.heightBox,
              Row(
                children: [
                  Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      // height: 25,
                      // width: 25,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  5.widthBox,
                  Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                ],
              ),
              10.heightBox,
              Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  width: 185,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 227, 227),
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
