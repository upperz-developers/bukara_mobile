import 'package:flutter/material.dart';

Widget line() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 1,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 215, 214, 214),
          ),
        ),
      ),
    ],
  );
}
