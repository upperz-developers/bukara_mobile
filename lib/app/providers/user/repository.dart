import 'package:bukara/app/services/http/dio_service.dart';
import 'package:bukara/app/services/shared/api_url.dart';
import 'package:dio/dio.dart';

Future<Response> loging({String? email, String? password}) async =>
    await httpPost(endPoint: APIURL.LOGIN, data: {
      "email": email,
      "password": password,
    });
