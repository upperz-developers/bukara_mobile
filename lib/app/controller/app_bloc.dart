import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/providers/suite/repository.dart';
import 'package:bukara/app/providers/user/model.dart';
import 'package:bukara/app/providers/user/repository.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/recouvrenement/modele.dart';
import '../providers/recouvrenement/repository.dart';
import '../providers/tennant/modele.dart';

//upperz

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(INITIALSTATE()) {
    on<LOGIN>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await loging(
          email: event.email,
          password: event.password,
        );

        ResultAuth resultAuth = ResultAuth.fromJson(response.data);
        UserPref userPref = UserPref(
          token: resultAuth.token,
          userName: resultAuth.data!.user!.email,
        );

        setUserInfo(userPref);
        emit(const SUCCESS());
      } on Exception catch (e) {
        emit(const ERROR());
        emit(ERROR(dueTo: e.toString()));
      }
    });

    // about singUp

    on<SINGUP>(
      ((event, emit) async {
        emit(const LOADING());

        try {
          await singup(
            email: event.email,
            password: event.password,
            confirmpassword: event.confirmepassword,
          );

          emit(const SUCCESS());
        } on Exception catch (e) {
          emit(ERROR(dueTo: e.toString()));
        }
      }),
    );

    on<CHANGEPASSWORD>(
      ((event, emit) async {
        emit(const LOADING());

        try {
          await changepassord(
            oldpassword: event.oldpassword,
            newpassword: event.newpassword,
            confirmpassword: event.confirmepassword,
          );

          emit(const SUCCESS());
        } on Exception catch (e) {
          emit(ERROR(dueTo: e.toString()));
        }
      }),
    );
    on<LOGOUT>(
      ((event, emit) async {
        emit(const LOADING());

        try {
          await logout(
            token: event.token,
          );

          emit(const SUCCESS());
        } on Exception catch (e) {
          emit(ERROR(dueTo: e.toString()));
        }
      }),
    );
    on<GETSUITE>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getSuite();
        ResultSuite resultSuite = ResultSuite.fromJson(response.data);
        emit(SUCCESS(
          value: resultSuite.data!.suites!,
        ));
      } on Exception catch (e) {
        emit(ERROR(
          dueTo: e.toString(),
        ));
      }
    });

    on<GETTENANT>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getTenant();
        TenantResult resultnotification = TenantResult.fromJson(response.data);
        emit(SUCCESS(
          value: resultnotification.data!.data!,
        ));
      } on Exception catch (e) {
        emit(ERROR(
          dueTo: e.toString(),
        ));
      }
    });

    on<GETRECOVERYINFO>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getRecoveryInfo();
        ResultRecovery recovery = ResultRecovery.fromJson(response.data);
        List<ContratData> contratData = recovery.data!.contratData!;
        emit(SUCCESS(value: contratData));
      } on Exception catch (e) {
        emit(ERROR(
          dueTo: e.toString(),
        ));
      }
    });
  }
}
