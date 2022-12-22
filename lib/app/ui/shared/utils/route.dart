import 'package:flutter/material.dart';
import 'package:bukara/app/ui/Screens/app_page.dart';
import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:bukara/app/ui/Screens/historique_page.dart';
import 'package:bukara/app/ui/Screens/home/home_page.dart';
import 'package:bukara/app/ui/Screens/information_profile.dart';
import 'package:bukara/app/ui/Screens/profil_page.dart';

import '../../auth/login_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  Home.routeName: (context) => const Home(),
  Historique.routeName: (context) => const Historique(),
  Profile.routeName: (context) => const Profile(),
  InfoProfile.routeName: (context) => const InfoProfile(),
  Details.routeName: (context) => const Details(),
  AppPage.routeName: (context) => const AppPage(),
};
