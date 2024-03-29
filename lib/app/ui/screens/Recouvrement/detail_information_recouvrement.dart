import 'package:bukara/app/ui/screens/Recouvrement/detail_paiement_par_recouvrement.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/utility.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/recouvrenement/modele.dart';

class InfoRecouvrement extends StatefulWidget {
  static String routeName = "/inforecouvrement";
  const InfoRecouvrement({
    Key? key,
  }) : super(key: key);
  @override
  State<InfoRecouvrement> createState() => _InfoRecouvrement();
}

class _InfoRecouvrement extends State<InfoRecouvrement> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDat) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    ContratData contratData =
        ModalRoute.of(context)!.settings.arguments as ContratData;
    return CustormScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Iconsax.arrow_left,
                ),
                color: const Color.fromARGB(169, 32, 32, 32),
              ),
              const Expanded(
                child: Text(
                  "Detail recouvrement",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              52.widthBox,
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: dayLeft(
                          start: DateTime.now().toString(),
                          end: contratData.dateRecovery!),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: const [
                        TextSpan(
                          text: " restant",
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Text.rich(
                    TextSpan(
                      text:
                          "Montant à payé ${contratData.rentalContrat!.amount}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                      children: const [
                        TextSpan(
                          text: " \$ mois",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Text(
                    "${contratData.rentalContrat!.appartement!.designation} - (${contratData.rentalContrat!.appartement!.features!.bedroom} chambres & ${contratData.rentalContrat!.appartement!.features!.livingroom} salon)",
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: AppColors.DISABLE_COLOR,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Iconsax.user,
                          size: 18,
                        ),
                      ),
                      15.widthBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${contratData.rentalContrat!.landlord!.name} ${contratData.rentalContrat!.landlord!.lastname}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Text("locataire"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        selectedRecoveryId = contratData.id;
                        Navigator.pushNamed(
                            context, RecouvrementDetailPaiement.routeName,
                            arguments: contratData);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color.fromARGB(255, 215, 214, 214),
                            ),
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 215, 214, 214),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.activity,
                            ),
                            15.widthBox,
                            const Expanded(
                              child: Text(
                                "Historic de paiement",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                            15.widthBox,
                            const Icon(
                              Iconsax.arrow_right_3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Calendrier",
                  ),
                  20.heightBox,
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
          ),
        ],
      ),
    );
  }
}
