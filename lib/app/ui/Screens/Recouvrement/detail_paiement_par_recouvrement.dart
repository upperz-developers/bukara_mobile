// ignore_for_file: unnecessary_type_check
import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/providers/paiement_modele/modele.dart';
import 'package:bukara/app/ui/Screens/paiement/suite_paiement.dart';
import 'package:bukara/app/ui/screens/pop_up/bad_resquet.dart';
import 'package:bukara/app/ui/shared/squelleton/paiement_squeletton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controller/app_state.dart';

class RecouvrementDetailPaiement extends StatefulWidget {
  static String routeName = "/recouvrementdetailpaiement";

  const RecouvrementDetailPaiement({
    Key? key,
  }) : super(key: key);

  @override
  State<RecouvrementDetailPaiement> createState() =>
      _RecouvrementDetailPaiement();
}

class _RecouvrementDetailPaiement extends State<RecouvrementDetailPaiement> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    bloc!.add(GETPEYEMENTPERRECOVERY());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (() => Navigator.pop(context)),
                  icon: const Icon(
                    Iconsax.arrow_left,
                  ),
                  color: const Color.fromARGB(169, 32, 32, 32),
                ),
                const Expanded(
                  child: Text(
                    "Paiements",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                52.widthBox,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<AppBloc, AppState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LOADING) {
                      return Column(
                          children: List.generate(
                        3,
                        (index) => const PaiementSquelleton(),
                      ));
                    } else if (state is SUCCESS) {
                      List<PayementHistoric> listepaiement =
                          state is SUCCESS ? state.value : [];
                      return Column(children: [
                        ...List.generate(
                          listepaiement.length,
                          (index) => SuitePaiement(
                            suitePaiement: listepaiement[index],
                          ),
                        ),
                      ]);
                    } else if (state is ERROR) {
                      return NoData(
                        message: "Aucune connexion internet",
                        onTap: (() {
                          bloc!.add(GETPEYEMENTPERRECOVERY());
                        }),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
