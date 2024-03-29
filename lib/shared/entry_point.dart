import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/ui/startPage/splash_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    AppPref.prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocProvider<AppBloc>(
      // when we just comment a folder here
      create: (context) => AppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Style.themeData(false, context),
        home: const SplashScreen(),
        routes: routes,
      ),
    );
  }
}
