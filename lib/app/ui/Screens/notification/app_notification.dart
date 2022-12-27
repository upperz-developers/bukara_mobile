import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/shared/squelleton/notification_squelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';

class NotificationApp extends StatefulWidget {
  const NotificationApp({super.key});

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notification",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<AppBloc, AppState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return state is SUCCESS
                            ? Column(
                                children: List.generate(
                                10,
                                (index) => notification(),
                              ))
                            : Column(
                                children: List.generate(
                                5,
                                (index) => const NotificationSquelleton(),
                              ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notification() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.DISABLE_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Notification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: 100,
            width: 15,
            decoration: const BoxDecoration(
              color: AppColors.BLACK_COLOR,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
