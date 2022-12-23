import 'package:bukara/app/ui/Screens/profile_information_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../shared/utils/widget.dart';
import 'home/view_model/suite_detail.dart';

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

  void _returnHome() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              const SuiteDetail(),
              card1(),
              line(),
              modele(Iconsax.document, "Appartemenent no 23"),
              modele(Iconsax.map,
                  "5,avenu du lac, quartier katindo1, commune de Goma,ville de Goma"),
              modele(Iconsax.home_hashtag, "4 chambres"),
              modele(Iconsax.home, "2 salons"),
              modele(Iconsax.d_cube_scan, "1 toilette interne"),
              modele2(Iconsax.activity, "0 toilette interne"),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 15,
                ),
                child: Row(
                  children: [
                    const Icon(Iconsax.shapes4),
                    10.widthBox,
                    const Expanded(
                      child: Text(
                        "Has tenant",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ),
                    10.widthBox,
                    Container(
                      height: 35,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.DISABLE_COLOR,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text("Yes")),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: line(),
              ),
              Container(
                padding: const EdgeInsets.only(left: 35),
                height: 20,
                width: 200,
                child: const Text(
                  "Autre information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              25.heightBox,
              modele(Iconsax.wifi, "Connexion"),
              modele(Iconsax.flash, "Cash power"),
              modele(Iconsax.home_trend_up, "Snel"),
              modele(Icons.water, "Regideso"),
              modele(Iconsax.d_cube_scan, "toilette interne"),
              modele2(Iconsax.activity, "toilette externe"),
              modele2(Iconsax.activity, "pisine"),
              modele2(Iconsax.activity, "Parking"),
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
                        ),
                        rightChevronIcon: Icon(
                          Iconsax.arrow_right_3,
                        ),
                        titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
              onPressed: _returnHome,
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

  Widget modele(
    IconData? icon,
    String? message,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 15,
      ),
      child: Row(
        children: [
          Icon(icon),
          10.widthBox,
          Expanded(
            child: Text(
              "$message",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget modele2(
    IconData? icon,
    String? message,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15,
      ),
      child: Row(
        children: [
          Icon(icon),
          10.widthBox,
          Expanded(
            child: Text(
              "$message",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }

  Widget card1() {
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
          const Text(
            "150\$ per months",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 90, 90, 90),
            ),
          ),
          15.heightBox,
          Wrap(
            children: const [
              Text(
                "Nous aimerions témoigner notre gratitude aux professeurs et enseignants de la section Informatique de l'ISIG-GOMA  qui ont assuré notre formation supérieure pour les conseils prodigués depuis la première année académique, sans lesquels ce travail n'aurait pas abouti à sa fin.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              Text(
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
            onTap: () => Navigator.pushNamed(context, InfoProfile.routeName),
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
    );
  }
}
