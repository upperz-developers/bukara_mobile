import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

errorModel(BuildContext context, {required List<ErrorData> dueTo}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Center(
        child: Icon(Iconsax.refresh),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              ...List.generate(
                dueTo.length,
                (index) => Column(
                  children: [
                    Text(
                      dueTo[index].rule!,
                    ),
                    Text(
                      dueTo[index].field!,
                    ),
                    Text(
                      dueTo[index].message!,
                    ),
                  ],
                ),
              ),
              30.heightBox,
              custormButtonLogout(
                context,
                colorText: AppColors.WHITE_COLOR,
                color: AppColors.BLACK_COLOR,
                title: "Quitter",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
