import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

errorModel(BuildContext context, {required List<ErrorData> dueTo}) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Center(
        child: Text(
          "Oups !!!",
          style: TextStyle(
            color: AppColors.BLACK_COLOR,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                dueTo.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (dueTo[index].field != null)
                      Text(
                        dueTo[index].field!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (dueTo[index].rule != null)
                      Text(
                        dueTo[index].rule!,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    5.heightBox,
                    if (dueTo[index].message != null)
                      Text(
                        dueTo[index].message!,
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                    if (index < dueTo.length - 1) line(),
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
