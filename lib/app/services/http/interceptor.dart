import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

@immutable
class ApiInterceptor extends Interceptor {
  final Dio dio;
  ApiInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.response!.data.toString());
    switch (err.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadLineExcededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
          default:
            throw ValidationInternalServerErrorException(err.requestOptions,
                data: err.response!.data);
        }

      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(requestOptions: err.requestOptions);
    }
  }
}

class ValidationInternalServerErrorException extends DioError {
  final Map<String, dynamic>? data;
  ValidationInternalServerErrorException(RequestOptions r, {this.data})
      : super(requestOptions: r);

  @override
  String toString() {
    ErrorModel errorModel = ErrorModel.fromJson(data!);
    return errorModel.errors!.first.message!;
  }
}

// if there is a time out, that mean the client don't reach the
// server, throw this exception

class DeadLineExcededException extends DioError {
  DeadLineExcededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Une erreur s'est produite en essayant de joindre le serveur";
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // this will be shown only in debug mode, in release we will change the sentence
    return "Mauvaise requette | Bad request error";
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Erreur de l'auhentification au serveur | Unauthorized error";
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // this will be shown only in debug mode, in release we will change the sentence
    return "Une erreur s'est produite, ceci est du à l'url que vous entrez | not found error";
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // this will be shown only in debug mode, in release we will change the sentence
    return "Une erreur s'est produite, conflit";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // this will be shown only in debug mode, in release we will change the sentence
    return "Une erreur s'est produite au serveur | internal server error";
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException({required super.requestOptions});

  @override
  String toString() {
    return "Aucune connexion internet";
  }
}
