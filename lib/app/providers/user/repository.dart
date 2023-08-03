import 'package:bukara/app/services/http/dio_service.dart';
import 'package:bukara/app/services/shared/api_url.dart';
import 'package:dio/dio.dart';

Future<Response> loging({
  String? email,
  String? password,
}) async =>
    await httpPost(endPoint: APIURL.LOGIN, data: {
      "email": email,
      "password": password,
    });
Future<Response> singup({
  String? email,
  String? password,
  String? confirmpassword,
}) async =>
    await httpPost(endPoint: APIURL.SINGUP, data: {
      "email": email,
      "password": password,
      "password_confirmation": confirmpassword,
    });

Future<Response> changepassord({
  String? oldpassword,
  String? newpassword,
  String? confirmpassword,
}) async =>
    await httpPutWithToken(endPoint: APIURL.CHANGEPASSWORD, data: {
      "oldPassword": oldpassword,
      "password": newpassword,
      "password_confirmation": confirmpassword,
    });

Future<Response> editeruser({
  Map<String, dynamic>? data,
}) async =>
    await httpPutWithToken(endPoint: APIURL.EDITERUSER, data: data);

Future<Response> logout({
  String? token,
}) async =>
    await httpPost(endPoint: APIURL.LOGOUT, data: {
      "token": token,
    });

Future<Response> checkmail({
  String? email,
}) async =>
    await httpPost(endPoint: APIURL.CHECKMAIL, data: {
      "email": email,
    });

Future<Response> validateCode({
  String? email,
  String? code,
}) async =>
    await httpPost(
      endPoint: APIURL.SENDCODE,
      data: {
        "email": email,
        "otp": code,
      },
    );

Future<Response> resetMotdepasse({
  String? password,
  String? confirmPassword,
  String? email,
}) async =>
    await httpPut(
      endPoint: APIURL.RESETPASSWORD + email!,
      data: {
        "password": password,
        "password_confirmation": confirmPassword,
      },
    );
