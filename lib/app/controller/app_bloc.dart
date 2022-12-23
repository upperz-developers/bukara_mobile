import 'package:bukara/app/controller/app_event.dart';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/user/model.dart';
import 'package:bukara/app/providers/user/repository.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        print(response.data);
        // ResultAuth resultAuth = ResultAuth.fromJson(response.data);
        // UserPref userPref = UserPref(
        //   token: resultAuth.token,
        //   userName: resultAuth.data!.user!.email,
        // );
        // setUserInfo(userPref);
        emit(const SUCCESS());
      } on Exception catch (e) {
        print(e.toString());
        emit(ERROR(dueTo: e.toString()));
      }
    });
  }
}
