// ignore_for_file: non_constant_identifier_names

import 'package:bukara/app/ui/Screens/home/view_model/suite.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:iconsax/iconsax.dart';
import '../../shared/style.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  bool hasScrolled = false;
  int indexPage = 0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          hasScrolled = _scrollController!.position.pixels >= 190;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: searchBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: List.generate(
                    3,
                    (index) => const Suite(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titlehome("Suite name"),
                      subtitlehome("Manager name"),
                      subtitlehome("10 dec - 3 mars"),
                      const SizedBox(
                        height: 10,
                      ),
                      subtitle2home("150 USD' par Mois"),
                    ],
                  ),
                  10.widthBox,
                  Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(169, 206, 205, 205),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Yes")),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget titlehome(String message) {
    return SizedBox(
      // width: 50,
      child: Text(
        message,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.BLACK_COLOR,
        ),
      ),
    );
  }

  Widget subtitlehome(String subtitle) {
    return SizedBox(
      // width: 50,
      child: Text(
        subtitle,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(169, 168, 167, 167),
        ),
      ),
    );
  }

  Widget subtitle2home(String subtitle) {
    return SizedBox(
      // width: 50,
      child: Text(
        subtitle,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.BLACK_COLOR),
      ),
    );
  }

  model1() {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/appart1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(208, 234, 234, 234).withAlpha(125),
            offset: const Offset(0, 3),
            blurRadius: 3,
          ),
        ],
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const TextField(
        decoration: (InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: "Seach your historic commande",
          icon: Icon(Iconsax.search_normal_1),
        )),
      ),
    );
  }
}
