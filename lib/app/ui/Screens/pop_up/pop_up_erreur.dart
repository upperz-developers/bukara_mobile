import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';

class Erreur extends StatefulWidget {
  const Erreur({super.key});

  @override
  State<Erreur> createState() => _Erreur();
}

class _Erreur extends State<Erreur> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {},
      child: BlocBuilder<AppBloc, AppState>(
        bloc: bloc,
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state is LOADING,
            child: SimpleDialog(
              title: const Center(
                child: Icon(Iconsax.refresh),
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    children: [
                      const Text(
                          "Une erreur c'est produite veuillez verifié la connexion internet"),
                      30.heightBox,
                      custormButtonLogout(
                        context,
                        colorText: AppColors.WHITE_COLOR,
                        color: AppColors.BLACK_COLOR,
                        title: "Quitter",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
