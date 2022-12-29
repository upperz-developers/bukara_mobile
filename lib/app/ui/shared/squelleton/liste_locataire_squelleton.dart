import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class ListeLocataireSquelleton extends StatelessWidget {
  const ListeLocataireSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Shimmer(
                  color: Colors.grey.withAlpha(10),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
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
                          borderRadius: BorderRadius.circular(10),
                          child: Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 227, 227, 227),
                              ),
                            ),
                          ),
                        ),
                        15.heightBox,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              width: MediaQuery.of(context).size.width / 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 227, 227, 227),
                              ),
                            ),
                          ),
                        ),
                        15.heightBox,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 227, 227, 227),
                              ),
                            ),
                          ),
                        ),
                        10.heightBox,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
