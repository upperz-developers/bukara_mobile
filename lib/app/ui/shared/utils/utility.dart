import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../style.dart';

Widget icon() {
  return Container(
    margin: const EdgeInsets.only(bottom: 25),
    height: 140,
    width: 140,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(
          'assets/icons/icon.png',
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget subtitle(String subtitle) {
  return Text(
    subtitle,
    textAlign: TextAlign.left,
    style: const TextStyle(color: AppColors.BLACK_COLOR),
  );
}

Widget title(String message) {
  return Text(
    message,
    textAlign: TextAlign.left,
    style: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFFebebeb),
    ),
  );
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? submit;
  final String? hint;
  final Widget? iconButton;
  const CustomTextField(
      {Key? key, this.controller, this.hint, this.iconButton, this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.BORDER_COLOR,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                /* setSate((){
                  submit,
                });*/
              },
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: AppColors.SCAFFOLD_BACKGROUND_LIGHT,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          if (iconButton != null)
            Row(
              children: [
                30.widthBox,
                iconButton!,
              ],
            ),
        ],
      ),
    );
  }
}

custormOutlineButtom(
  BuildContext context, {
  Color? color,
  String? title,
  Color? colorText,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(
        12,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255),
            // offset: Offset(0, 5),
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.BORDER_COLOR,
        ),
        color: color,
      ),
      child: Text(
        "$title",
        style: TextStyle(
          color: colorText,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

custormButton(
  BuildContext context, {
  Color? color,
  String? title,
  Color? colorText,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(
        15,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(.15),
              offset: const Offset(0, 5),
              blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(40),
        color: color,
      ),
      child: Text(
        "$title",
        style: TextStyle(
          color: colorText,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
