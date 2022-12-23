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
// test about singup
Future<Response> singup({
  String? email,
  String? password,
  String? confirmpassword,
  String? code,
}) async =>
    await httpPost(endPoint: APIURL.SINGUP, data: {
      "email": email,
      "password": password,
      "confirmpassword": confirmpassword,
      "code": code,
    });
