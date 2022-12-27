import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';

class NotificationApp extends StatefulWidget {
  const NotificationApp({super.key});

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 15,
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
              20.heightBox,
              SingleChildScrollView(
                child: Column(
                    children: List.generate(
                  5,
                  (index) => notification(),
                )),
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
