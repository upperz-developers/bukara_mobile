import 'package:bukara/app/services/http/dio_service.dart';
import 'package:bukara/app/services/shared/api_url.dart';
import 'package:dio/dio.dart';

Future<Response> getSuite() async => httpGetWithToken(
      endPoint: APIURL.GETAPARTURL,
    );
Future<Response> getTenant() async => await httpGetWithToken(
      endPoint: APIURL.GETTENANT,
    );
