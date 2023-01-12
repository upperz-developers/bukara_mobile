import 'package:bukara/app/ui/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class NoData extends StatelessWidget {
  final String message;
  final Function() onTap;
  const NoData({super.key, required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/no_data.svg",
          ),
          15.heightBox,
          Text(
            message,
            style: const TextStyle(
              color: AppColors.SECOND_TEXT_COLOR,
            ),
          ),
          15.heightBox,
          OnHoverEffect(
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.DISABLE_COLOR,
                        borderRadius: BorderRadius.circular(4)),
                    alignment: Alignment.center,
                    child: const Text(
                      "Reessayer",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
