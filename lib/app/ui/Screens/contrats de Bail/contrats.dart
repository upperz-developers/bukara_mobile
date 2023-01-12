import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/providers/contrat/model.dart';
import 'package:bukara/app/ui/Screens/contrats%20de%20Bail/detail_contrats.dart';
import 'package:bukara/app/ui/shared/squelleton/contrat_squeletton.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/utility_fonction/customer_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_bloc.dart';
import '../../../controller/app_state.dart';

class ContratScreen extends StatefulWidget {
  static String routeName = "/contratbail";
  const ContratScreen({super.key});

  @override
  State<ContratScreen> createState() => _ContratScreen();
}

class _ContratScreen extends State<ContratScreen> {
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
                    if (state is SUCCESS) {
                      List<Contrat> listecontrats = state.value;
                      return Column(
                        children: List.generate(
                          listecontrats.length,
                          (index) => contraModel(listecontrats[index]),
                        ),
                      );
                    } else if (state is LOADING) {
                      return Column(
                        children: List.generate(
                          3,
                          (index) => const ContratSqueletton(),
                        ),
                      );
                    } else {
                      return Container();
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

  Widget contraModel(Contrat contrat) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailContrat.routeName,
          arguments: contrat,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.BORDER_COLOR,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${contrat.landlord!.name} ${contrat.landlord!.lastname}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${contrat.appartement!.designation}",
                  ),
                  15.heightBox,
                  Text(
                    CustomDate(date: DateTime.parse(contrat.startDate!))
                        .getFullDate,
                    style: const TextStyle(
                      color: AppColors.SECOND_TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            10.widthBox,
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${contrat.amount}\$",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Par moi",
                  style: TextStyle(
                    color: AppColors.SECOND_TEXT_COLOR,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
