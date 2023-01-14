import 'dart:convert';
import 'package:bukara/app/controller/app_state.dart';
import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/services/http/interceptor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

hundleError({required Exception e, required Emitter<AppState> emit}) {
  bool isBukaraCustomException = e is ValidationInternalServerErrorException ||
      e is DeadLineExcededException ||
      e is BadRequestException ||
      e is UnauthorizedException ||
      e is NotFoundException ||
      e is ConflictException ||
      e is InternalServerErrorException ||
      e is NoInternetConnectionException;
  if (isBukaraCustomException) {
    Map<String, dynamic> data = jsonDecode(e.toString());

    ErrorModel errormodele = ErrorModel.fromJson(data);
    emit(
      ERROR(
        dueTo: errormodele,
      ),
    );
  } else {
    ErrorModel errormodel = ErrorModel();
    errormodel.errors!.add(
      ErrorData(
        message: "Une erreur s'est produite veuillez  ressayer plustard",
      ),
    );
    emit(
      ERROR(
        dueTo: errormodel,
      ),
    );
  }
}
