import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:bukara/app/ui/Screens/auth/login_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../screens/app_page.dart';

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
      if (getUserInfo().userPerfsInfo != null) {
        AppPref.showUserPerf.value = getUserInfo().userPerfsInfo!;
      }

      Navigator.pushReplacementNamed(context, AppPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                  color: AppColors.DISABLE_COLOR,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/icon.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          30.heightBox,
          const Text(
            "BUKARA Sarl",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          3.heightBox,
          const Text(
            "Build by Upperz in parternship with Devinno",
            style: TextStyle(
              fontSize: 10,
              color: AppColors.SECOND_TEXT_COLOR,
            ),
          ),
          3.heightBox,
          const Text(
            "V1.0.0",
            style: TextStyle(
              fontSize: 10,
              color: AppColors.SECOND_TEXT_COLOR,
            ),
          ),
        ],
      ),
    ));
  }
}
