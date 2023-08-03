import 'package:bukara/app/providers/contrat/model.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/customer_date.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailContrat extends StatefulWidget {
  static String routeName = "/detailContrat";
  const DetailContrat({
    Key? key,
  }) : super(key: key);
  @override
  State<DetailContrat> createState() => _DetailContrat();
}

class _DetailContrat extends State<DetailContrat> {
  @override
  Widget build(BuildContext context) {
    Contrat contrat = ModalRoute.of(context)!.settings.arguments as Contrat;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: CustormScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${contrat.landlord!.name} ${contrat.landlord!.lastname}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "${contrat.landlord!.email}",
                    ),
                    line(),
                    if (contrat.appartement != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${contrat.appartement?.description}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          20.heightBox,
                        ],
                      ),
                    if (contrat.appartement != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.heightBox,
                          const Text(
                            "Detail appartement",
                          ),
                          15.heightBox,
                          caracteristic(contrat.appartement!),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  line(),
                  const Text(
                    "Contrat enregistre par",
                  ),
                  15.heightBox,
                  if (contrat.user!.name != null)
                    Column(
                      children: [
                        Text(
                          "${contrat.user!.name} ${contrat.user!.lastname}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.heightBox,
                      ],
                    ),
                  Text(
                    "${contrat.landlord!.email}",
                  ),
                  30.heightBox,
                  Column(
                    children: [
                      Text(
                        "Signe ${CustomDate(date: DateTime.parse(contrat.startDate!)).getFullDate}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.SECOND_TEXT_COLOR,
                        ),
                      ),
                      if (contrat.endDate != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.heightBox,
                            Text(
                              "Resilie ${CustomDate(date: DateTime.parse(contrat.endDate!)).getFullDate}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.SECOND_TEXT_COLOR,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  24.heightBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget caracteristic(SuiteModel suite) {
    return Column(
      children: [
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
}
