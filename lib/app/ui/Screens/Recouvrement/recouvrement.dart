import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/screens/Recouvrement/suite_recouvrement.dart';
import 'package:bukara/app/ui/screens/pop_up/bad_resquet.dart';
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
  AppBloc bloc = AppBloc();
  @override
  void initState() {
    bloc.add(
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
            left: 20,
            right: 20,
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
                        if (state is LOADING) {
                          return Column(
                              children: List.generate(
                            3,
                            (index) => const RecouvrementSquelleton(),
                          ));
                        } else if (state is SUCCESS) {
                          List<ContratData> listeRecouvrement = state.value;
                          return Column(
                            children: [
                              20.heightBox,
                              ...List.generate(
                                listeRecouvrement.length,
                                (index) => SuiteRecouvrement(
                                  suiteRecouvrement: listeRecouvrement[index],
                                ),
                              ),
                            ],
                          );
                        } else if (state is ERROR) {
                          return NoData(
                            dueTo: state.dueTo!.errors!,
                            onTap: (() {
                              bloc.add(
                                GETRECOVERYINFO(),
                              );
                            }),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
