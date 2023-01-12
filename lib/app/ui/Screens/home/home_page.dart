import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/screens/home/suite/suite_model.dart';
import 'package:bukara/app/ui/screens/pop_up/pop_up_bad_resquet.dart';
import 'package:bukara/app/ui/shared/squelleton/suite_squelleton.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
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
  AppBloc bloc = AppBloc();

  @override
  void initState() {
    bloc.add(
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
                horizontal: 20,
              ),
              child: searchBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 100,
                ),
                child: BlocBuilder<AppBloc, AppState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is LOADING) {
                        return Column(
                            children: List.generate(
                          3,
                          (index) => const SuiteSqueletton(),
                        ));
                      } else if (state is SUCCESS) {
                        List<SuiteModel> listeSuite =
                            // ignore: unnecessary_type_check
                            state is SUCCESS ? state.value : [];
                        return Column(
                          children: List.generate(
                            listeSuite.length,
                            (index) => Column(
                              children: [
                                Suite(
                                  suite: listeSuite[index],
                                ),
                                if (index != listeSuite.length - 1)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: line(),
                                  ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is ERROR) {
                        return NoData(
                          message: state.dueTo.toString(),
                          onTap: (() {
                            bloc.add(
                              GETSUITE(),
                            );
                          }),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ),
            ),
          ],
        ),
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
          hintText: "Recherchez votre apparement",
          icon: Icon(Iconsax.search_normal_1),
        )),
      ),
    );
  }
}
