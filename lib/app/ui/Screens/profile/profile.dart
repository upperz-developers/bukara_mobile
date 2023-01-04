import 'package:bukara/app/services/prefs/app_prefs.dart';
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
                          fontSize: 30,
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
                    if (user.phoneNumber != null && user.email != null)
                      15.heightBox,
                    Text(
                      "${user.countryCode} (0) ${user.phoneNumber}",
                      style: const TextStyle(
                        // fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "#${user.email}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                    10.heightBox,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.heightBox,
                            line(),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, EditerUser.routeName),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Editer Profile",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            10.heightBox,
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, ChangePassword.routeName),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Changer mot de passe",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            10.heightBox,
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, AboutPage.routeName),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Appropos de l'Application",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.heightBox,
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const Logout(),
                                  barrierDismissible: false,
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text(
                                        "Deconnexion",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.logout,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: const [
                          Text(
                            "BUKARA v1.0.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Builid by Devinna in partenship with\n Upperz",
                            style: TextStyle(
                              color: AppColors.SECOND_TEXT_COLOR,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    45.heightBox,
                  ],
                ),
              );
            }),
      ),
    );
  }
}
