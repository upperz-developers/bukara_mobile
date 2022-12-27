import 'package:bukara/app/ui/shared/squelleton/liste_locataire_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';

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
                "Liste locateiares",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<AppBloc, AppState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return state is SUCCESS
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
                      }),
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
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
        ),
        height: 250,
        decoration: BoxDecoration(
          color: AppColors.DISABLE_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "John doe",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text(
              "physical person",
              style: TextStyle(
                color: AppColors.BLACK_COLOR,
              ),
            ),
            15.heightBox,
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Numero Telephone",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "+243 976 829 270",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    10.heightBox,
                    const Text(
                      "Etat-Civil",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Celibataire",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                    10.heightBox,
                    const Text(
                      "Addresse",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Goma, C de Goma, Q les volcan,av des avenues, num 10",
                      style: TextStyle(
                        color: AppColors.SECOND_TEXT_COLOR,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
