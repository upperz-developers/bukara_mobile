import 'package:bukara/app/ui/screens/Recouvrement/recouvrement.dart';
import 'package:flutter/material.dart';
import '../../shared/style.dart';
import '../paiement/historique_paiement.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              isScrollable: true,
              padding: const EdgeInsets.only(
                bottom: 0,
                top: 15,
              ),
              controller: _tabControllertop,
              unselectedLabelColor: AppColors.SECOND_TEXT_COLOR,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2),
              ),
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
                    "Paiement",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabControllertop,
                children: const [
                  Recouvrement(),
                  Paiement(),
                ]),
          ),
        ],
      ),
    );
  }
}
