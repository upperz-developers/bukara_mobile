import 'dart:io';
import 'package:bukara/app/providers/user/model.dart';
import 'package:bukara/app/services/prefs/app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:bukara/app/services/http/dio_helper.dart';

Future<Response> httpGet(
    {String? endPoint, Map<String, dynamic>? parameters}) async {
  return await Dio().get(
    "$endPoint",
    queryParameters: parameters,
    options: Options(
      headers: {
        "X-Requested-With": "XMLHttpRequest",
      },
    ),
  );
}

Future<Response> httpGetWithToken(
    {String? endPoint, Map<String, dynamic>? parameters}) async {
  Token token = getUserInfo().token!;
  return await DioApi().dio.get(
        endPoint!,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.token}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

/// ----------------------------------------------------------
/// Http "POST" request
/// ----------------------------------------------------------
Future<Response> httpPost(
    {String? endPoint, Map<String, dynamic>? data}) async {
  Token token = getUserInfo().token!;

  return await DioApi().dio.post(
        endPoint!,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.token}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
        data: data,
      );
}

Future<Response> httpPostWithToken({String? endPoint, var data}) async {
  Token token = getUserInfo().token!;

  return await DioApi().dio.post(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.token}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

Future<Response> httpPutWithToken({String? endPoint, var data}) async {
  Token token = getUserInfo().token!;
  return await DioApi().dio.put(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.token}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

Future<Response> httpPut({String? endPoint, var data}) async {
  return await DioApi().dio.put(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}
