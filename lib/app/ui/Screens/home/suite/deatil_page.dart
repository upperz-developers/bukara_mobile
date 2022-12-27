import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/Screens/profile/tenant_information.dart';
import 'package:bukara/app/ui/screens/home/suite/suite_model.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDat) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    SuiteModel suiteDetail =
        ModalRoute.of(context)!.settings.arguments as SuiteModel;
    return Scaffold(
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
              if (suiteDetail.status!) bookingInfo(),
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
    );
  }

  Widget bookingInfo() {
    return Column(
      children: [
        line(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Booking date",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              10.heightBox,
              const Text(
                "10 days left until end",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.start,
              ),
              5.heightBox,
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "" +
                    today.toString().split(" ")[0] +
                    " - " +
                    today.toString().split(" ")[0],
                //"10 dec - 10 mar",
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 117, 117, 117)),
                textAlign: TextAlign.start,
              ),
              15.heightBox,
              TableCalendar(
                rowHeight: 53,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  headerPadding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  titleCentered: true,
                  leftChevronIcon: Icon(
                    Iconsax.arrow_left_2,
                    color: Colors.black,
                  ),
                  rightChevronIcon: Icon(
                    Iconsax.arrow_right_3,
                    color: Colors.black,
                  ),
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      shape: BoxShape.circle),
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2050, 3, 14),
                onDaySelected: _onDaySelected,
              ),
            ],
          ),
        ),
      ],
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
            title: "Connxion internet",
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

  Widget caracteristicModel({
    IconData? icon,
    String? title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(icon),
          15.widthBox,
          Expanded(
            child: Text(
              title!,
            ),
          ),
        ],
      ),
    );
  }

  Widget otherCaracteristicModel(
      {IconData? icon, String? title, List<String>? otherCarteristic}) {
    ValueNotifier<bool> isExist = ValueNotifier(false);
    if (otherCarteristic != null) {
      for (int i = 0; i < otherCarteristic.length; i++) {
        if (otherCarteristic[i] == title) {
          isExist.value = true;
          break;
        }
      }
    }
    return ValueListenableBuilder(
        valueListenable: isExist,
        builder: (context, bool exist, child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              children: [
                Icon(icon),
                15.widthBox,
                Expanded(
                  child: Text(
                    title!,
                    style: TextStyle(
                      height: 1.5,
                      decoration:
                          exist == false ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
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
          const Text(
            "Name of appartement",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          10.heightBox,
          Text(
            "${suite.price}\$ par mois",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          15.heightBox,
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
              children: [
                line(),
                const Text(
                  "Suite manager",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.start,
                ),
                25.heightBox,
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, InfoProfile.routeName),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColors.DISABLE_COLOR,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.user,
                          size: 20,
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "John doe",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "entreprise",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 161, 161, 161)),
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