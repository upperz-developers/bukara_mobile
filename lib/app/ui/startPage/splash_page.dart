// import 'package:community/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/auth/login_page.dart';

import '../shared/utils/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasStarted = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
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
