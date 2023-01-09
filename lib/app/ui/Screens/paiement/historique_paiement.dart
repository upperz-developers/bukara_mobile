import 'package:bukara/app/ui/screens/paiement/suite_paiement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_event.dart';
import '../../../controller/app_state.dart';
import '../../../providers/paiement_modele/modele.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _Paiement();
}

class _Paiement extends State<Paiement> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc()
      ..add(
        GETPAYEMENT(),
      );
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
                      List<PayementHistoric> listepaiement =
                          state is SUCCESS ? state.value : [];
                      return state is SUCCESS
                          ? Column(children: [
                              ...List.generate(
                                listepaiement.length,
                                (index) => SuitePaiement(
                                  suitePaiement: listepaiement[index],
                                ),
                              ),
                            ])
                          : Column(
                              children: List.generate(
                                1,
                                (index) => const Center(
                                  child: Text("paiement loading"),
                                ),
                              ),
                            );
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
}
