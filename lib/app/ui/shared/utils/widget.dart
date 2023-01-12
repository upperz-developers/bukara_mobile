import 'package:bukara/app/controller/app_state.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

import '../style.dart';

Widget line({double? padding}) {
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

Widget custormButton(
  BuildContext context, {
  Color? color,
  String? title,
  Color? colorText,
  Function()? onTap,
  AppState? state,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state is LOADING
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    color: AppColors.WHITE_COLOR,
                  ),
                )
              : Text(
                  "$title",
                  style: TextStyle(
                    color: colorText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    ),
  );
}

class FormText extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool? optinal;
  final bool? submitted;
  const FormText(
      {super.key, this.hint, this.controller, this.optinal, this.submitted});

  @override
  Widget build(BuildContext context) {
    bool validation =
        optinal != false && controller!.text.isEmpty && submitted == true;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: validation ? 1.5 : 1,
          color: validation ? AppColors.RED_COLOR : AppColors.BORDER_COLOR,
        ),
      ),
      child: TextField(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class FormPassWordText extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool? submitted;
  const FormPassWordText(
      {super.key, this.hint, this.controller, this.submitted});

  @override
  State<FormPassWordText> createState() => _FormPassWordTextState();
}

class _FormPassWordTextState extends State<FormPassWordText> {
  ValueNotifier<bool> isObscure = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    bool validation =
        widget.controller!.text.isEmpty && widget.submitted == true;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: validation ? 1.5 : 1,
          color: validation ? AppColors.RED_COLOR : AppColors.BORDER_COLOR,
        ),
      ),
      child: ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, bool isObscureText, child) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    controller: widget.controller,
                    obscureText: isObscureText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: widget.hint,
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                10.widthBox,
                InkWell(
                  onTap: () {
                    isObscure.value = !isObscure.value;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      isObscureText ? Iconsax.eye : Iconsax.eye_slash,
                      size: 16,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

Widget caracteristicModel({
  IconData? icon,
  String? title,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Row(
      children: [
        Icon(icon),
        15.widthBox,
        Expanded(
          child: Text(
            title!,
          ),
        ),
      ],
    ),
  );
}

Widget otherCaracteristicModel(
    {IconData? icon, String? title, List<String>? otherCarteristic}) {
  ValueNotifier<bool> isExist = ValueNotifier(false);
  if (otherCarteristic != null) {
    for (int i = 0; i < otherCarteristic.length; i++) {
      if (otherCarteristic[i] == title) {
        isExist.value = true;
        break;
      }
    }
  }
  return ValueListenableBuilder(
      valueListenable: isExist,
      builder: (context, bool exist, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            children: [
              Icon(icon),
              15.widthBox,
              Expanded(
                child: Text(
                  title!,
                  style: TextStyle(
                    height: 1.5,
                    decoration:
                        exist == false ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
