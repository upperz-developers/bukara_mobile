
import 'package:bukara/app/ui/screens/Recouvrement/detail_information_recouvrement.dart';
import 'package:bukara/app/ui/screens/Recouvrement/detail_paiement_par_recouvrement.dart';
import 'package:bukara/app/ui/screens/app_page.dart';
import 'package:bukara/app/ui/screens/auth/forgot_password/check_mail.dart';
import 'package:bukara/app/ui/screens/auth/forgot_password/new_password.dart';
import 'package:bukara/app/ui/screens/auth/forgot_password/otp_page.dart';
import 'package:bukara/app/ui/screens/auth/login_page.dart';
import 'package:bukara/app/ui/screens/auth/singup_page.dart';
import 'package:bukara/app/ui/screens/contrats_de_bail/contrats.dart';
import 'package:bukara/app/ui/screens/contrats_de_bail/detail_contrats.dart';
import 'package:bukara/app/ui/screens/home/home_page.dart';
import 'package:bukara/app/ui/screens/home/suite/deatil_page.dart';
import 'package:bukara/app/ui/screens/locataire/detail_information_locataire.dart';
import 'package:bukara/app/ui/screens/paiement/detail_paiement.dart';
import 'package:bukara/app/ui/screens/profile/about_page.dart';
import 'package:bukara/app/ui/screens/profile/change_password.dart';
import 'package:bukara/app/ui/screens/profile/editer_profile.dart';
import 'package:bukara/app/ui/screens/profile/profile.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  Home.routeName: (context) => const Home(),
  Profile.routeName: (context) => const Profile(),
  InfoLocataire.routeName: (context) => const InfoLocataire(),
  Details.routeName: (context) => const Details(),
  AppPage.routeName: (context) => const AppPage(),
  SingUpPage.routeName: (context) => const SingUpPage(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  Otp.routeName: (context) => const Otp(),
  Newpassword.routeName: (context) => const Newpassword(),
  ChangePassword.routeName: (context) => const ChangePassword(),
  AboutPage.routeName: (context) => const AboutPage(),
  InfoRecouvrement.routeName: (context) => const InfoRecouvrement(),
  EditerUser.routeName: (context) => const EditerUser(),
  ContratScreen.routeName: (context) => const ContratScreen(),
  DetailContrat.routeName: (context) => const DetailContrat(),
  DetailPaiement.routeName: (context) => const DetailPaiement(),
  RecouvrementDetailPaiement.routeName: (context) =>
      const RecouvrementDetailPaiement(),
};
