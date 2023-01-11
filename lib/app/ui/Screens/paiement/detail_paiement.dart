import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/paiement_modele/modele.dart';
import '../../shared/utils/widget.dart';

class DetailPaiement extends StatefulWidget {
  static String routeName = "/detailpaiement";

  const DetailPaiement({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPaiement> createState() => _DetailPaiement();
}

class _DetailPaiement extends State<DetailPaiement> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDat) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    PayementHistoric paiementData =
        ModalRoute.of(context)!.settings.arguments as PayementHistoric;
    return SafeArea(
      child: Scaffold(
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
                    "Detail paiement",
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
                        text: "${paiementData.amount} ${paiementData.currenty}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        children: const [
                          TextSpan(
                            text: " par mois",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.heightBox,
                    Text.rich(
                      TextSpan(
                        text: "${paiementData.contratData!.labelStr}",
                        children: [
                          TextSpan(
                            text: " - ${paiementData.contratData!.labelMonth}",
                            style: const TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Text(
                      "${paiementData.contratData!.rentalContrat!.appartement!.designation} - (${paiementData.contratData!.rentalContrat!.appartement!.features!.bedroom} chambres & ${paiementData.contratData!.rentalContrat!.appartement!.features!.livingroom} salon)",
                    ),
                    Text(
                      "${paiementData.contratData!.rentalContrat!.appartement!.typeAppartement!.designation} - ${paiementData.contratData!.rentalContrat!.appartement!.typeBien!.designation}",
                      style: const TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    30.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${paiementData.contratData!.rentalContrat!.landlord!.name} ${paiementData.contratData!.rentalContrat!.landlord!.lastname}",
                          ),
                        ),
                        20.widthBox,
                        const Text(
                          "Locataire",
                          style: TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${paiementData.contratData!.rentalContrat!.user!.email}",
                          ),
                        ),
                        15.widthBox,
                        const Text(
                          "Signateur",
                          style: TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: line(),
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
