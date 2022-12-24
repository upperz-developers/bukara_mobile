// import 'package:community/views/auth/login.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/Screens/auth/login_page.dart';
import 'package:bukara/app/ui/Screens/home/app_page.dart';
import 'package:flutter/material.dart';

import '../shared/utils/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    Future.delayed(const Duration(seconds: 5), () {
      UserPref userpref = getUserInfo();
      if (userpref.token!.token!.isEmpty) {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
        return;
      }
      Navigator.pushReplacementNamed(context, AppPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: icon(),
        ),
      ),
    );
  }
}
