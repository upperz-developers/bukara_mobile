import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/ui/screens/locataire/suite_locataire.dart';
import 'package:bukara/app/ui/screens/pop_up/bad_resquet.dart';
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
  AppBloc bloc = AppBloc();
  @override
  void initState() {
    bloc.add(
      GETTENANT(),
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
              // 10.heightBox,
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
                        if (state is LOADING) {
                          return Column(
                              children: List.generate(
                            3,
                            (index) => const ListeLocataireSquelleton(),
                          ));
                        } else if (state is SUCCESS) {
                          List<TenantModel> listeNotification =
                              // ignore: unnecessary_type_check
                              state is SUCCESS ? state.value : [];
                          return Column(children: [
                            ...List.generate(
                              listeNotification.length,
                              (index) => SuiteLocataire(
                                suiteNotification: listeNotification[index],
                              ),
                            ),
                            30.heightBox,
                          ]);
                        } else if (state is ERROR) {
                          return NoData(
                            dueTo: state.dueTo!.errors!,
                            onTap: (() {
                              bloc.add(
                                GETTENANT(),
                              );
                            }),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
