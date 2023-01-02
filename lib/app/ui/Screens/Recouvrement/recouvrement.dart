import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/shared/squelleton/notification_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';

class Recouvrement extends StatefulWidget {
  const Recouvrement({super.key});

  @override
  State<Recouvrement> createState() => _Recouvrement();
}

class _Recouvrement extends State<Recouvrement> {
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
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recouvrement",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: BlocBuilder<AppBloc, AppState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return state is LOADING
                          ? Column(
                              children: List.generate(
                              10,
                              (index) => recouvrement(),
                            ))
                          : Column(
                              children: List.generate(
                              6,
                              (index) => const NotificationSquelleton(),
                            ));
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

  Widget recouvrement() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Nom Appartment",
                      ),
                    ),
                    50.widthBox,
                    const Text(
                      "28/12/2022 à 15h30",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                10.heightBox,
                Row(children: [
                  const Icon(
                    Iconsax.profile_circle,
                    size: 20,
                  ),
                  5.widthBox,
                  const Text(
                    "John Doe",
                  ),
                ]),
                10.heightBox,
                const Text(
                  "3 mois et 5 jours restants ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                10.heightBox,
                const Text(
                  "Date",
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              width: 5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(115, 185, 185, 185),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
