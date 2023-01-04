import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/screens/Recouvrement/suite_recouvrement.dart';
import 'package:bukara/app/ui/shared/squelleton/recouvrement_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_event.dart';
import '../../../providers/recouvrenement/modele.dart';

class Recouvrement extends StatefulWidget {
  const Recouvrement({super.key});

  @override
  State<Recouvrement> createState() => _Recouvrement();
}

class _Recouvrement extends State<Recouvrement> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc()
      ..add(
        GETRECOVERYINFO(),
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
            top: 20,
            bottom: 50,
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
                      List<ContratData> listeRecouvrement =
                          state is SUCCESS ? state.value : [];
                      return state is SUCCESS
                          ? Column(
                              children: List.generate(
                                listeRecouvrement.length,
                                (index) => SuiteRecouvrement(
                                  suiteRecouvrement: listeRecouvrement[index],
                                ),
                              ),
                            )
                          : Column(
                              children: List.generate(
                                3,
                                (index) => const RecouvrementSquelleton(),
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
