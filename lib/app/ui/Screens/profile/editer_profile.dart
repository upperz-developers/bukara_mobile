import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/Screens/pop_up/pop_up_erreur.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/custorm_scaffold.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:velocity_x/velocity_x.dart';

class EditerUser extends StatefulWidget {
  static String routeName = "/editerUser";
  const EditerUser({Key? key}) : super(key: key);
  @override
  State<EditerUser> createState() => _EditerUser();
}

class _EditerUser extends State<EditerUser> {
  AppBloc? bloc;
  @override
  void initState() {
    bloc = AppBloc();
    editerUserController.init();
    super.initState();
  }

  bool editerSubmitted = false;
  void _submit() {
    editerUserController.editerProfileSumbit(bloc!);
  }

  AuthViewController editerUserController = AuthViewController();
  @override
  Widget build(BuildContext context) {
    return CustormScaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SUCCESS) {
            Navigator.pop(context);
          } else if (state is ERROR) {
            errorModel(context, dueTo: state.dueTo!.errors!);
          }
        },
        child: BlocBuilder<AppBloc, AppState>(
            bloc: bloc,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is LOADING,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Iconsax.arrow_left,
                          ),
                          color: const Color.fromARGB(169, 32, 32, 32),
                        ),
                        const Expanded(
                          child: Text(
                            "Modifier Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        52.widthBox,
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Numéro Téléphone",
                            ),
                            10.heightBox,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppColors.BORDER_COLOR,
                                ),
                              ),
                              child: TextFormField(
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: '### ### ###',
                                    filter: {
                                      "#": RegExp(r'\d'),
                                    },
                                  )
                                ],
                                controller: editerUserController.phonenumber,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(16.0),
                                  hintText: 'Télephone',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                  prefixIcon: CountryCodePicker(
                                    onChanged: (contryCode) {
                                      editerUserController.codeCountry =
                                          contryCode.code!;
                                    },
                                    boxDecoration: BoxDecoration(
                                      color: AppColors.WHITE_COLOR,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    initialSelection: 'CD',
                                    favorite: const ["+243", 'CD'],
                                    showCountryOnly: true,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                    flagWidth: 20.0,
                                    showFlagDialog: true,
                                    showFlag: true,
                                    searchStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    dialogTextStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    searchDecoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(16.0),
                                      hintText: 'Rechercher Pays',
                                      hintStyle: TextStyle(
                                        color: AppColors.GREY_COLOR,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  errorStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: AppColors.BLACK_COLOR,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            20.heightBox,
                            const Text(
                              "Nom",
                            ),
                            10.heightBox,
                            FormText(
                              controller: editerUserController.name,
                              hint: "Entrez votre Nom",
                            ),
                            20.heightBox,
                            const Text(
                              "Postnom",
                            ),
                            10.heightBox,
                            FormText(
                              controller: editerUserController.lastname,
                              hint: "Entrez votre Postnom",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 25),
                      child: custormButton(
                        context,
                        color: AppColors.BLACK_COLOR,
                        title: "Modifier",
                        colorText: Colors.white,
                        state: state,
                        onTap: _submit,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
