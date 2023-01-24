import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/Screens/contrats_de_bail/contrats.dart';
import 'package:bukara/app/ui/Screens/profile/about_page.dart';
import 'package:bukara/app/ui/Screens/profile/change_password.dart';
import 'package:bukara/app/ui/screens/profile/editer_profile.dart';
import 'package:bukara/app/ui/screens/profile/logout.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  static String routeName = "/infoprofile";
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: AppPref.showUserPerf,
            builder: (context, UserPerfsInfo user, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (user.name != null)
                      Text(
                        "${user.name} ${user.lastname}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (user.phoneNumber != null && user.email != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.heightBox,
                                  Text(
                                    "${user.countryCode} (0) ${user.phoneNumber}",
                                    style: const TextStyle(
                                      // fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            10.heightBox,
                            Text(
                              "${user.email}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.BLACK_COLOR,
                              ),
                            ),
                            line(),
                            profileActions(
                              title: (user.email == null ||
                                      user.lastname == null ||
                                      user.phoneNumber == null ||
                                      user.name == null)
                                  ? "Completer le profile"
                                  : "Modifier Profile",
                              onTap: () => Navigator.pushNamed(
                                context,
                                EditerUser.routeName,
                              ),
                            ),
                            profileActions(
                              title: "Changer mot de passe",
                              onTap: () => Navigator.pushNamed(
                                context,
                                ChangePassword.routeName,
                              ),
                            ),
                            profileActions(
                              title: "Déconnexion",
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const Logout(),
                                  barrierDismissible: false,
                                );
                              },
                            ),
                            line(),
                            profileActions(
                              title: "contrat de bail",
                              onTap: () => Navigator.pushNamed(
                                context,
                                ContratScreen.routeName,
                              ),
                            ),
                            profileActions(
                              title: "Appropos de l'application",
                              onTap: () => Navigator.pushNamed(
                                context,
                                AboutPage.routeName,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget profileActions({String? title, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
