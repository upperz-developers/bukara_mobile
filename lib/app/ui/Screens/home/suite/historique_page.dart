import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/shared/squelleton/historique_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../controller/app_bloc.dart';

class Historique extends StatefulWidget {
  static String routeName = "/historique";
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _Historique();
}

class _Historique extends State<Historique> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(
                Iconsax.arrow_left,
              ),
              color: const Color.fromARGB(169, 32, 32, 32),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                  child: BlocBuilder<AppBloc, AppState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return state is SUCCESS
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Historique Paiement",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  card1(
                                    "Name of suite",
                                    "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                                  ),
                                  card1(
                                    "Name of suite",
                                    "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                                  ),
                                  card1(
                                    "Name of suite",
                                    "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                                  ),
                                ],
                              )
                            : Column(
                                children: List.generate(
                                  4,
                                  (index) => const HistoriqueSquelleton(),
                                ),
                              );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card1(String? title, String? message) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$message",
                      style:
                          const TextStyle(color: AppColors.SECOND_TEXT_COLOR),
                    ),
                    10.heightBox,
                    const Text(
                      "150\$",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                  ]),
            ),
            const Icon(
              Iconsax.arrow_right_3,
            ),
          ],
        ),
      ),
    );
  }
}