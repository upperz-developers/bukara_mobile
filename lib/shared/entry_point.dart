import 'package:bukara/app/controller/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/ui/startPage/splash_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return BlocProvider<AppBloc>(
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
