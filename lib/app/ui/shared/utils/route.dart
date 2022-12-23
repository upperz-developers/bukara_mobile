import 'package:bukara/app/ui/Screens/profile_information_page.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/Screens/home/app_page.dart';
import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:bukara/app/ui/Screens/historique_page.dart';
import 'package:bukara/app/ui/Screens/home_page.dart';

import '../../Screens/auth/check_mail.dart';
import '../../Screens/auth/login_page.dart';
import '../../Screens/auth/new_password.dart';
import '../../Screens/auth/otp_page.dart';
import '../../Screens/auth/singup_page.dart';
import '../../Screens/change_password.dart';
import '../../Screens/profile.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  Home.routeName: (context) => const Home(),
  Historique.routeName: (context) => const Historique(),
  Profile.routeName: (context) => const Profile(),
  InfoProfile.routeName: (context) => const InfoProfile(),
  Details.routeName: (context) => const Details(),
  AppPage.routeName: (context) => const AppPage(),
  SingUpPage.routeName: (context) => const SingUpPage(),
  Checkmail.routeName: (context) => const Checkmail(),
  Otp.routeName: (context) => const Otp(),
  Newpassword.routeName: (context) => const Newpassword(),
  ChangePassword.routeName: (context) => const ChangePassword()
};
