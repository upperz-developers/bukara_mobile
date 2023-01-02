import 'package:bukara/app/ui/screens/profile/tenant_information.dart';
import 'package:flutter/material.dart';
import '../../Screens/auth/check_mail.dart';
import '../../Screens/auth/login_page.dart';
import '../../Screens/auth/new_password.dart';
import '../../Screens/auth/otp_page.dart';
import '../../Screens/auth/singup_page.dart';
import '../../Screens/home/suite/historique_page.dart';
import '../../Screens/profile/about_page.dart';
import '../../Screens/profile/change_password.dart';
import '../../Screens/profile/profile.dart';
import '../../screens/app_page.dart';
import '../../screens/home/home_page.dart';
import '../../screens/home/suite/deatil_page.dart';
import '../../screens/profile/detail_information_locataire.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  Home.routeName: (context) => const Home(),
  Historique.routeName: (context) => const Historique(),
  Profile.routeName: (context) => const Profile(),
  InfoLocataire.routeName: (context) => const InfoLocataire(),
  Details.routeName: (context) => const Details(),
  AppPage.routeName: (context) => const AppPage(),
  SingUpPage.routeName: (context) => const SingUpPage(),
  Checkmail.routeName: (context) => const Checkmail(),
  Otp.routeName: (context) => const Otp(),
  Newpassword.routeName: (context) => const Newpassword(),
  ChangePassword.routeName: (context) => const ChangePassword(),
  AboutPage.routeName: (context) => const AboutPage(),
  InfoProfile.routeName: (context) => const InfoProfile(),
};
