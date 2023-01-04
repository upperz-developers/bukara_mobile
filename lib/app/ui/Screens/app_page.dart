import 'package:bukara/app/ui/Screens/profile/profile.dart';
import 'package:bukara/app/ui/screens/home/home_page.dart';
import 'package:bukara/app/ui/screens/locataire/liste_locataire.dart';
import 'package:flutter/material.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import 'Recouvrement/recouvrement.dart';

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
                  TopTabBar(),
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

class TopTabBar extends StatefulWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabControllertop;
  @override
  void initState() {
    super.initState();
    _tabControllertop = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabControllertop!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
                child: TabBar(
                    controller: _tabControllertop,
                    unselectedLabelColor: AppColors.SECOND_TEXT_COLOR,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 0.0)),
                    //indicatorColor: Colors.white,
                    indicatorWeight: 5.0,
                    labelColor: AppColors.BLACK_COLOR,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Recouvrement",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Historique de paie",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: _tabControllertop, children: const [
        Recouvrement(),
        Center(
          child: Text(
            "historique de paiment",
            style: TextStyle(
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ),
      ]),
    );
  }
}
