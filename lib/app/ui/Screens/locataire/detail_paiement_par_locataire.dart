// import 'package:bukara/app/providers/tennant/modele.dart';
import 'package:flutter/material.dart';
// import 'package:bukara/app/ui/shared/style.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
// import '../../../providers/recouvrenement/modele.dart';
// import '../../shared/utils/widget.dart';

class DetailPaiementLocataire extends StatefulWidget {
  static String routeName = "/detailpaiementlocataire";

  const DetailPaiementLocataire({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPaiementLocataire> createState() => _DetailPaiementLocataire();
}

class _DetailPaiementLocataire extends State<DetailPaiementLocataire> {
  // DateTime today = DateTime.now();
  // void _onDaySelected(DateTime day, DateTime focusedDat) {
  //   setState(() {
  //     today = day;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // TenantModel PaiementData =
    //     ModalRoute.of(context)!.settings.arguments as TenantModel;
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
                    " Recouvrement Detail paiement",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                52.widthBox,
              ],
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     physics: const BouncingScrollPhysics(),
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 24,
            //       vertical: 15,
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text.rich(
            //           TextSpan(
            //             text:
            //                 "${PaiementData.rentalContrat!.amount} ${contratData.rentalContrat!.currency}",
            //             style: const TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 30,
            //             ),
            //             children: const [
            //               TextSpan(
            //                 text: " par mois",
            //                 style: TextStyle(
            //                   fontSize: 14,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         15.heightBox,
            //         Text(
            //           "${contratData.labelStr}",
            //         ),
            //         10.heightBox,
            //         Text(
            //           " Date du paiement - ${contratData.createdAt}",
            //           style: const TextStyle(
            //             color: AppColors.SECOND_TEXT_COLOR,
            //             fontSize: 14,
            //             fontWeight: FontWeight.normal,
            //           ),
            //         ),
            //         10.heightBox,
            //         Text(
            //           "${contratData.rentalContrat!.appartement!.designation} - (${contratData.rentalContrat!.appartement!.features!.bedroom} chambres & ${contratData.rentalContrat!.appartement!.features!.livingroom} salon)",
            //         ),
            //         Text(
            //           "${contratData.rentalContrat!.appartement!.typeAppartement!.designation} - ${contratData.rentalContrat!.appartement!.typeBien!.designation}",
            //           style: const TextStyle(
            //             color: AppColors.SECOND_TEXT_COLOR,
            //           ),
            //         ),
            //         30.heightBox,
            //         Row(
            //           children: [
            //             Expanded(
            //               child: Text(
            //                 "${contratData.rentalContrat!.landlord!.name} ${contratData.rentalContrat!.landlord!.lastname}",
            //               ),
            //             ),
            //             20.widthBox,
            //             const Text(
            //               "Locataire",
            //               style: TextStyle(
            //                 color: AppColors.SECOND_TEXT_COLOR,
            //                 fontSize: 12,
            //               ),
            //             ),
            //           ],
            //         ),
            //         20.heightBox,
            //         Row(
            //           children: [
            //             Expanded(
            //               child: Text(
            //                 "${contratData.rentalContrat!.user!.email}",
            //               ),
            //             ),
            //             15.widthBox,
            //             const Text(
            //               "Signateur",
            //               style: TextStyle(
            //                 color: AppColors.SECOND_TEXT_COLOR,
            //                 fontSize: 12,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //             vertical: 15,
            //           ),
            //           child: line(),
            //         ),
            //         TableCalendar(
            //           rowHeight: 53,
            //           headerStyle: const HeaderStyle(
            //             formatButtonVisible: false,
            //             headerPadding: EdgeInsets.only(
            //               bottom: 10,
            //             ),
            //             titleCentered: true,
            //             leftChevronIcon: Icon(
            //               Iconsax.arrow_left_2,
            //               color: Colors.black,
            //             ),
            //             rightChevronIcon: Icon(
            //               Iconsax.arrow_right_3,
            //               color: Colors.black,
            //             ),
            //             titleTextStyle: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 18),
            //           ),
            //           calendarStyle: const CalendarStyle(
            //             selectedDecoration: BoxDecoration(
            //                 color: Color.fromARGB(255, 0, 0, 0),
            //                 shape: BoxShape.circle),
            //             todayDecoration: BoxDecoration(
            //                 color: Color.fromARGB(255, 0, 0, 0),
            //                 shape: BoxShape.circle),
            //           ),
            //           availableGestures: AvailableGestures.all,
            //           selectedDayPredicate: (day) => isSameDay(day, today),
            //           focusedDay: today,
            //           firstDay: DateTime.utc(2010, 10, 16),
            //           lastDay: DateTime.utc(2050, 3, 14),
            //           onDaySelected: _onDaySelected,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
