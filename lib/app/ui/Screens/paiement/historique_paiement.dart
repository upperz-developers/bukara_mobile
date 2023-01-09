import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _Paiement();
}

class _Paiement extends State<Paiement> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    // ..add(
    //   GETTENANT(),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: BlocBuilder<AppBloc, AppState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return Column(children: [
                        ...List.generate(
                          16,
                          (index) => modelepaiement(
                              "Name of suite",
                              "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                              "150",
                              "date du jours"),
                        ),
                      ]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modelepaiement(
      String? title, String? message, String? montant, String? date) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: InkWell(
        onTap: () {},
        child: Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "$title",
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "$message",
              style: const TextStyle(color: AppColors.SECOND_TEXT_COLOR),
            ),
            10.heightBox,
            Text(
              "$montant\$",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            10.heightBox,
            Text(
              "$date",
            ),
          ]),
        ),
      ),
    );
  }
}
