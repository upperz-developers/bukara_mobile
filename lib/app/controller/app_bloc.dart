import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/providers/suite/repository.dart';
import 'package:bukara/app/providers/user/model.dart' as u;
import 'package:bukara/app/providers/user/repository.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/paiement_modele/modele.dart';
import '../providers/paiement_modele/repository.dart';
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

        u.ResultAuth resultAuth = u.ResultAuth.fromJson(response.data);

        UserPref userPref = UserPref(
          token: resultAuth.token,
          userPerfsInfo: UserPerfsInfo(
            email: resultAuth.data!.user!.email,
            name: resultAuth.data!.user!.name,
            lastname: resultAuth.data!.user!.lastname,
            countryCode: resultAuth.data!.user!.countryCode,
            phoneNumber: resultAuth.data!.user!.phoneNumber,
          ),
        );

        setUserInfo(userPref);
        AppPref.showUserPerf.value = getUserInfo().userPerfsInfo!;
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

    on<EDITERUSER>(
      ((event, emit) async {
        emit(const LOADING());

        try {
          var response = await editeruser(data: event.data);

          u.User user = u.User.fromJson(response.data['data']);
          UserPref userPref = getUserInfo();
          userPref.userPerfsInfo = UserPerfsInfo(
            email: user.email,
            name: user.name,
            lastname: user.lastname,
            countryCode: user.countryCode,
            phoneNumber: user.phoneNumber,
          );
          setUserInfo(userPref);
          AppPref.showUserPerf.value = getUserInfo().userPerfsInfo!;
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
    on<GETCONTRATINFO>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getContratInfo();
        ResultRecovery contrats = ResultRecovery.fromJson(response.data);
        List<ContratData> contratData = contrats.data!.contratData!;
        emit(SUCCESS(value: contratData));
      } on Exception catch (e) {
        emit(ERROR(
          dueTo: e.toString(),
        ));
      }
    });

    on<GETPAYEMENT>((event, emit) async {
      emit(const LOADING());

      try {
        // AppBloc().add(GETENTERPRISE());
        var response = await getPayement();
        ResultHistoricPaiements resultPayement =
            ResultHistoricPaiements.fromJson(response.data);
        List<PayementHistoric> payements = resultPayement.data!.payments!;
        emit(SUCCESS(value: payements));
      } on Exception catch (e) {
        emit(ERROR(dueTo: e.toString()));
      }
    });
  }
}
