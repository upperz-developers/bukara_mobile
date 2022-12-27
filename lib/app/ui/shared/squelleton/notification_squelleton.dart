import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NotificationSquelleton extends StatelessWidget {
  const NotificationSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Shimmer(
                color: Colors.grey.withAlpha(10),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.DISABLE_COLOR,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Shimmer(
                color: AppColors.DISABLE_COLOR.withAlpha(10),
                child: Container(
                  height: 100,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
