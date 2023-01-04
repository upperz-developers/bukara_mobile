import 'package:bukara/app/controller/app_bloc.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/ui/view_controller/auth_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/style.dart';
import '../../shared/utils/widget.dart';

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
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AppBloc, AppState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is SUCCESS) {
              Navigator.pop(context);
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
                              "Editer Profile",
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
                              subtitle("Numero Telephone"),
                              10.heightBox,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.BORDER_COLOR,
                                  ),
                                ),
                                child: TextFormField(
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                              subtitle("Nom"),
                              10.heightBox,
                              FormText(
                                controller: editerUserController.name,
                                hint: "Entrez votre Nom",
                                //submitted: singupSubmitted,
                              ),
                              20.heightBox,
                              subtitle("Post nom"),
                              10.heightBox,
                              FormText(
                                controller: editerUserController.lastname,
                                hint: "Entrez votre Prenom",
                                //submitted: singupSubmitted,
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
                          title: "Editer",
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
      ),
    );
  }
}
