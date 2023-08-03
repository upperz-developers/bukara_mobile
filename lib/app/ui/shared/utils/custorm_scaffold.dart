import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';

class CustormScaffold extends StatelessWidget {
  final Widget body;
  const CustormScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
      child: SafeArea(
          child: Scaffold(
        body: body,
      )),
    );
  }
}
