import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/ui/screens/locataire/suite_locataire.dart';
import 'package:bukara/app/ui/shared/squelleton/liste_locataire_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';
import '../../../providers/tennant/modele.dart';

class LIsteLocataire extends StatefulWidget {
  const LIsteLocataire({super.key});

  @override
  State<LIsteLocataire> createState() => _LIsteLocataireState();
}

class _LIsteLocataireState extends State<LIsteLocataire> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc()
      ..add(
        GETTENANT(),
      );
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
                      List<TenantModel> listeNotification =
                          state is SUCCESS ? state.value : [];

                      return state is SUCCESS
                          ? Column(
                              children: List.generate(
                                listeNotification.length,
                                (index) => SuiteLocataire(
                                  suiteNotification: listeNotification[index],
                                ),
                              ),
                            )
                          : Column(
                              children: List.generate(
                              6,
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
}
