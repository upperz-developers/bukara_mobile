import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LIsteLocataire extends StatefulWidget {
  const LIsteLocataire({super.key});

  @override
  State<LIsteLocataire> createState() => _LIsteLocataireState();
}

class _LIsteLocataireState extends State<LIsteLocataire> {
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
                "Liste locateiares",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              30.heightBox,
              const Expanded(
                child: SingleChildScrollView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
