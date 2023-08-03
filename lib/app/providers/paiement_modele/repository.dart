import 'package:bukara/app/services/http/dio_service.dart';
import 'package:bukara/app/services/shared/api_url.dart';
import 'package:dio/dio.dart';

Future<Response> getPayement() async => await httpGetWithToken(
      endPoint: APIURL.GETPAYEMENT,
    );

Future<Response> getPayementPerRecovery({String? recoverId}) async =>
    await httpGetWithToken(endPoint: APIURL.GETPAYEMENT, parameters: {
      "recovery_id": recoverId,
    });
