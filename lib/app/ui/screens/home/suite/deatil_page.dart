import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/screens/contrats_de_bail/detail_contrats.dart';
import 'package:bukara/app/ui/screens/home/suite/suite_model.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shared/utils/widget.dart';

class Details extends StatefulWidget {
  static String routeName = "/details";
  const Details({Key? key}) : super(key: key);
  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    SuiteModel suiteDetail =
        ModalRoute.of(context)!.settings.arguments as SuiteModel;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.TRANSPARENT,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SuiteImage(
                  images: suiteDetail.images!,
                  height: 400,
                  borderRadius: 0,
                ),
                card1(suiteDetail),
                line(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      caracteristic(suiteDetail),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                        child: Divider(),
                      ),
                      const Text("Autres informations",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      30.heightBox,
                      otherInfo(suiteDetail.features!.other!),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.DISABLE_COLOR,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Iconsax.arrow_left,
                  size: 18,
                ),
                color: const Color.fromARGB(169, 32, 32, 32),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget caracteristic(SuiteModel suite) {
    return Column(
      children: [
        caracteristicModel(
          title: "#numero ${suite.number}",
          icon: Iconsax.box,
        ),
        caracteristicModel(
          title:
              "${suite.address!.number}, ${suite.address!.street}, ${suite.address!.quarter}, commune, ${suite.address!.town}, province, ${suite.address!.country}",
          icon: Iconsax.map_1,
        ),
        caracteristicModel(
          title: "${suite.features!.bedroom} chambres",
          icon: Iconsax.box,
        ),
        caracteristicModel(
          title: "${suite.features!.livingroom} salons",
          icon: Iconsax.home,
        ),
        caracteristicModel(
          title: "${suite.features!.interntoilet} toillette interne",
          icon: Iconsax.safe_home,
        ),
        caracteristicModel(
          title: "${suite.features!.externtoilet} toillette externe",
          icon: Iconsax.activity,
        ),
      ],
    );
  }

  Widget otherInfo(List<String> otherCarteristic) {
    return Column(
      children: [
        otherCaracteristicModel(
            title: "Connexion internet",
            icon: Iconsax.wifi,
            otherCarteristic: otherCarteristic),
        otherCaracteristicModel(
          title: "Cash power",
          icon: Iconsax.flash,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Snel",
          icon: Iconsax.flash,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Eau",
          icon: Iconsax.omega_circle,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Cuisine",
          icon: Iconsax.omega_circle,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Toilette interne",
          icon: Iconsax.safe_home,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Toillette externe",
          icon: Iconsax.activity,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Piscine",
          icon: Iconsax.activity,
          otherCarteristic: otherCarteristic,
        ),
        otherCaracteristicModel(
          title: "Parking",
          icon: Iconsax.activity,
          otherCarteristic: otherCarteristic,
        ),
      ],
    );
  }

  Widget card1(SuiteModel suite) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${suite.designation}",
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          10.heightBox,
          Text(
            "${suite.price}\$ par mois",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          20.heightBox,
          Wrap(
            children: [
              Text(
                suite.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.SECOND_TEXT_COLOR,
                ),
              ),
              if (suite.description!.length > 100)
                const Text(
                  "Voir plus",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                  ),
                ),
            ],
          ),
          if (suite.status!)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailContrat.routeName,
                      arguments: suite.contrats!.first,
                    );
                  },
                  child: Row(
                    children:  [
                      const Expanded(
                        child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contrat de bail",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ),
                      15.widthBox,
                      const Icon(
                        Iconsax.arrow_right_3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
