import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../controller/app_state.dart';
import '../../shared/style.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Deconnexion"),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              const Text("Voulez-vous vraiment vous deconnecter?"),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  custormButtonLogout(
                    context,
                    color: AppColors.DISABLE_COLOR,
                    title: "OUI",
                    onTap: () {},
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
  }

  Widget custormButtonLogout(
    BuildContext context, {
    Color? color,
    String? title,
    Color? colorText,
    Function()? onTap,
    AppState? state,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state is LOADING
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: AppColors.WHITE_COLOR,
                    ),
                  )
                : Text(
                    "$title",
                    style: TextStyle(
                      color: colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
