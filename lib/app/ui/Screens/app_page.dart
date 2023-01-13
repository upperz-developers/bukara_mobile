import 'package:bukara/app/ui/Screens/profile/profile.dart';
import 'package:bukara/app/ui/screens/Recouvrement/tabcontrol.dart';
import 'package:bukara/app/ui/screens/home/home_page.dart';
import 'package:bukara/app/ui/screens/locataire/liste_locataire.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

List<IconData> selectedicons = [
  Iconsax.home_15,
  Iconsax.activity5,
  Iconsax.task_square5,
  Iconsax.profile_circle5,
];

List<IconData> unselectedicons = [
  Iconsax.home,
  Iconsax.activity,
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
      child: Container(
        color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Home(),
                    TopTabBar(),
                    LIsteLocataire(),
                    Profile(),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: bottomNavigation()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      height: 65,
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
        border: Border(top: BorderSide(color: AppColors.DISABLE_COLOR)),
      ),
      child: Wrap(
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
            padding: const EdgeInsets.all(25),
            child: Icon(
              selectedIndex == index ? selectedicon : unselectedicon,
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
