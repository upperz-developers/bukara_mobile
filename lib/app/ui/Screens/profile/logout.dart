import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/ui/screens/auth/login_page.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_state.dart';
import '../../../services/prefs/app_prefs.dart';
import '../../shared/style.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  void _submit() {
    {
      bloc!.add(
        LOGOUT(token: getUserInfo().token!.token),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is SUCCESS) {
          AppPref.prefs!.clear();
          Navigator.pushNamedAndRemoveUntil(
              context, LoginPage.routeName, (route) => false);
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
          bloc: bloc,
          builder: (context, state) {
            return IgnorePointer(
              ignoring: state is LOADING,
              child: SimpleDialog(
                title: const Text("Déconnexion"),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Column(
                      children: [
                        const Text("Voulez-vous vraiment vous déconnecter?"),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            custormButtonLogout(
                              context,
                              color: AppColors.DISABLE_COLOR,
                              title: "OUI",
                              state: state,
                              onTap: _submit,
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
              ),
            );
          }),
    );
  }
}
