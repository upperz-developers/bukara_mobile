import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../providers/recouvrenement/modele.dart';
import '../../shared/utils/utility fonction/utility.dart';
import '../../shared/utils/widget.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// A widget that is used to display an icon.

            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Iconsax.arrow_left,
              ),
              color: const Color.fromARGB(169, 32, 32, 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                            children: [
                              Text(
                                "${contratData.rentalContrat!.landlord!.name} ${contratData.rentalContrat!.landlord!.lastname}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${contratData.rentalContrat!.landlord!.email}",
                                style: const TextStyle(
                                  color: AppColors.SECOND_TEXT_COLOR,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.widthBox,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.DISABLE_COLOR,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Locataire",
                            style: TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        15.widthBox,
                      ],
                    ),
                    20.heightBox,
                    Text(
                      "${contratData.rentalContrat!.appartement!.designation} - (${contratData.rentalContrat!.appartement!.features!.bedroom} chambres & ${contratData.rentalContrat!.appartement!.features!.livingroom} salon)",
                    ),
                    Text(
                      "${contratData.rentalContrat!.appartement!.typeAppartement!.designation} - ${contratData.rentalContrat!.appartement!.typeBien!.designation}",
                      style: const TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    20.heightBox,
                    Text.rich(
                      TextSpan(
                        text: "${contratData.rentalContrat!.amount}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        children: const [
                          TextSpan(
                            text: " USD par mois",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${contratData.rentalContrat!.user!.email}",
                              ),
                              Text(
                                contratData.rentalContrat!.user!.name == null
                                    ? "Pas definit"
                                    : "${contratData.rentalContrat!.user!.email}",
                                style: const TextStyle(
                                  color: AppColors.SECOND_TEXT_COLOR,
                                  height: 1.5,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        15.widthBox,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.DISABLE_COLOR,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Signateur",
                            style: TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        15.widthBox,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: line(),
                    ),
                    Text.rich(
                      TextSpan(
                        text: dayLeft(
                            start: contratData.rentalContrat!.startDate!,
                            end: contratData.dateRecovery!),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(
                            text: " - ${contratData.labelMonth}",
                            style: const TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
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
