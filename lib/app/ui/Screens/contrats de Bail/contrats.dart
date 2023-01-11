import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/providers/recouvrenement/modele.dart';
import 'package:bukara/app/ui/screens/contrats%20de%20Bail/suite_contrats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';

class Contrat extends StatefulWidget {
  static String routeName = "/contrat";
  const Contrat({super.key});

  @override
  State<Contrat> createState() => _Contrat();
}

class _Contrat extends State<Contrat> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc()
      ..add(
        GETCONTRAT(),
      );
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Iconsax.arrow_left,
                  ),
                  color: const Color.fromARGB(169, 32, 32, 32),
                ),
                const Expanded(
                  child: Text(
                    "Contrats",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                52.widthBox,
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 50,
                ),
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<AppBloc, AppState>(
                  bloc: bloc,
                  builder: (context, state) {
                    List<RentalContrat> listecontrats =
                        state is SUCCESS ? state.value : [];
                    return state is SUCCESS
                        ? Column(
                            children: [
                              ...List.generate(
                                listecontrats.length,
                                (index) => SuiteContrats(
                                  suiteContrats: listecontrats[index],
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text("loading contrat"),
                          );
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
