import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class RecouvrementSquelleton extends StatelessWidget {
  const RecouvrementSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  padding: const EdgeInsets.all(
                    17,
                  ),
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            10.heightBox,
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      padding: const EdgeInsets.all(
                        15,
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                    ),
                  ),
                ),
                5.widthBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Shimmer(
                    color: Colors.grey.withAlpha(10),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 227, 227, 227),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  padding: const EdgeInsets.all(
                    7,
                  ),
                  width: 250,
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
