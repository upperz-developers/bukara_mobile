import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bukara/app/services/http/dio_helper.dart';

httpGet({String? endPoint, Map<String, dynamic>? parameters}) async {
  String lang =
      Platform.localeName.substring(0, Platform.localeName.indexOf('_'));

  return await Dio().get(
    "$endPoint",
    queryParameters: parameters,
    options: Options(
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "lang": lang,
      },
    ),
  );
}

httpGetWithToken({String? endPoint, Map<String, dynamic>? parameters}) async {
  String lang =
      Platform.localeName.substring(0, Platform.localeName.indexOf('_'));
  return await DioApi().dio.get(
        endPoint!,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ',
            'X-Requested-With': 'XMLHttpRequest',
            'lang': lang,
          },
        ),
      );
}

/// ----------------------------------------------------------
/// Http "POST" request
/// ----------------------------------------------------------
httpPost({String? endPoint, Map<String, dynamic>? data}) async {
  String lang =
      Platform.localeName.substring(0, Platform.localeName.indexOf('_'));

  return await DioApi().dio.post(
        endPoint!,
        options: Options(
          headers: {
            "X-Requested-With": "XMLHttpRequest",
            'Content-Type': 'application/json',
            'lang': lang,
          },
        ),
        data: data,
      );
}

httpPostWithToken({String? endPoint, var data}) async {
  String lang = Platform.localeName.substring(
    0,
    Platform.localeName.indexOf('_'),
  );

  return await DioApi().dio.post(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer',
            'X-Requested-With': 'XMLHttpRequest',
            'lang': lang,
          },
        ),
      );
}

httpPutWithToken({String? endPoint, var data}) async {
  String lang =
      Platform.localeName.substring(0, Platform.localeName.indexOf('_'));
  return await DioApi().dio.put(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer',
            'X-Requested-With': 'XMLHttpRequest',
            'lang': lang
          },
        ),
      );
}
