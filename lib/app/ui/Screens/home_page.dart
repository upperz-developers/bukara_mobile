// ignore_for_file: non_constant_identifier_names

import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/Screens/home/view_model/suite.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

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
  AppBloc? bloc;

  @override
  void initState() {
    bloc = AppBloc()
      ..add(
        GETSUITE(),
      );

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
                child: BlocBuilder<AppBloc, AppState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is SUCCESS) {
                        List<SuiteModel> listeSuite = state.value;
                        return Column(
                          children: List.generate(
                            listeSuite.length,
                            (index) => Suite(
                              suite: listeSuite[index],
                            ),
                          ),
                        );
                      } else if (state is LOADING) {
                        return Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                              color: AppColors.DISABLE_COLOR,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Chargement..."),
                              CircularProgressIndicator(
                                color: AppColors.BLACK_COLOR,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Text("");
                      }
                    }),
              ),
            ),
          ],
        ),
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
          hintText: "Seach your apparemement",
          icon: Icon(Iconsax.search_normal_1),
        )),
      ),
    );
  }
}
