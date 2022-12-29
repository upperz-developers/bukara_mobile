import 'package:bukara/app/ui/shared/squelleton/liste_locataire_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class LIsteLocataire extends StatefulWidget {
  const LIsteLocataire({super.key});

  @override
  State<LIsteLocataire> createState() => _LIsteLocataireState();
}

class _LIsteLocataireState extends State<LIsteLocataire> {
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
                "Liste locataires",
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
                              (index) => modele(),
                            ))
                          : Column(
                              children: List.generate(
                              5,
                              (index) => const ListeLocataireSquelleton(),
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

  Widget modele() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(
              15,
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
                  "John doe",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //5.heightBox,
                const Text(
                  "+243 976 829 270",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                15.heightBox,
                const Text(
                  "appartement",
                  style: TextStyle(),
                ),
                5.heightBox,
                const Text(
                  "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                  style: TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontSize: 12,
                  ),
                ),
                15.heightBox,
                const Text(
                  " souscrit le 12/01/2022",
                  style: TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
