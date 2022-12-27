import 'package:bukara/app/ui/Screens/profile/profile.dart';
import 'package:bukara/app/ui/screens/home/home_page.dart';
import 'package:bukara/app/ui/screens/profile/liste_locataire.dart';
import 'package:bukara/app/ui/shared/squelleton/suite_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import 'notification/app_notification.dart';

List<IconData> selectedicons = [
  Iconsax.home_15,
  Iconsax.notification5,
  Iconsax.task_square5,
  Iconsax.profile_circle5,
];

List<IconData> unselectedicons = [
  Iconsax.home,
  Iconsax.notification,
  Iconsax.task_square,
  Iconsax.profile_circle,
];

class AppPage extends StatefulWidget {
  static String routeName = "/app";
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPage();
}

class _AppPage extends State<AppPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String selectMenu = "home";
  @override
  void initState() {
    super.initState();

    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Home(),
                  NotificationApp(),
                  LIsteLocataire(),
                  Profile(),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter, child: bottomNavigation()),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        border: Border(top: BorderSide(color: AppColors.DISABLE_COLOR)),
      ),
      child: Wrap(
          spacing: 30,
          alignment: WrapAlignment.center,
          children: List.generate(
            selectedicons.length,
            (index) => modelIcon(
              selectedicon: selectedicons[index],
              unselectedicon: unselectedicons[index],
              index: index,
            ),
          )),
    );
  }

  modelIcon({
    IconData? selectedicon,
    IconData? unselectedicon,
    required index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;

          _tabController!.animateTo(index);
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 5,
              left: 10,
              right: 10,
            ),
            child: Icon(
              selectedIndex == index ? selectedicon : unselectedicon,
              color: AppColors.BLACK_COLOR,
            ),
          ),
          if (index == 1)
            Positioned(
              right: 5,
              top: 3,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.SCAFFOLD_BACKGROUND_LIGHT),
                  color: AppColors.BLACK_COLOR,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "+9",
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: AppColors.WHITE_COLOR),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
