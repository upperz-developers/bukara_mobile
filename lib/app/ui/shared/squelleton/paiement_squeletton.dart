import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class PaiementSquelleton extends StatelessWidget {
  const PaiementSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 10,
          top: 10,
          bottom: 15,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: AppColors.DISABLE_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      height: 15,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                15.widthBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      height: 10,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            15.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  width: 80,
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            15.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  height: 10,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            8.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(4),
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
