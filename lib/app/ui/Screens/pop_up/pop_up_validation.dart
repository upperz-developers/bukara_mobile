import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';

class Validation extends StatefulWidget {
  const Validation({super.key});

  @override
  State<Validation> createState() => _Validation();
}

class _Validation extends State<Validation> {
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
          return SimpleDialog(
            title: const Center(
              child: Text("Deconnexion"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        custormButtonLogout(
                          context,
                          color: AppColors.DISABLE_COLOR,
                          title: "OUI",
                          state: state,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        20.widthBox,
                        custormButtonLogout(
                          context,
                          colorText: AppColors.WHITE_COLOR,
                          color: AppColors.BLACK_COLOR,
                          title: "NON",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
