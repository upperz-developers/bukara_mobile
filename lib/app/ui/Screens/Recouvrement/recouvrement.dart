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
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => recouvrement(),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // BlocBuilder<AppBloc, AppState>(
  //                   bloc: bloc,
  //                   builder: (context, state) {
  //                     return state is LOADING
  //                         ? Column(
  //                             children: List.generate(
  //                             10,
  //                             (index) => recouvrement(),
  //                           ),)
  //                         : Column(
  //                             children: List.generate(
  //                             6,
  //                             (index) => const RecouvrementSquelleton(),
  //                           ),);
  //                   },
  //                 ),

  Widget recouvrement() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 10,
              top: 5,
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
                const Text(
                  "paiement loyer du mois de fevier",
                ),
                20.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            const Text(
                              "John doe",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            3.heightBox,
                            const Text(
                              "+243 (0) 976829270",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 161, 161, 161),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                15.heightBox,
                const Text(
                  "5 jours restants ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
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
