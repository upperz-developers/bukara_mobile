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
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Shimmer(
            color: Colors.grey.withAlpha(10),
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              height: 250,
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
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(190, 236, 236, 236),
                      ),
                    ),
                  ),
                  15.heightBox,
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Numero Telephone",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(190, 236, 236, 236),
                              ),
                            ),
                          ),
                          10.heightBox,
                          const Text(
                            "Etat-Civil",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(190, 236, 236, 236),
                              ),
                            ),
                          ),
                          10.heightBox,
                          const Text(
                            "Addresse",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          Shimmer(
                            color: Colors.grey.withAlpha(10),
                            child: Container(
                              height: 30,
                              //width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(190, 236, 236, 236),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
