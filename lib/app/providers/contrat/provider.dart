import 'package:bukara/app/services/http/dio_service.dart';
import 'package:bukara/app/services/shared/api_url.dart';
import 'package:dio/dio.dart';

Future<Response> getContrat() async => await httpGetWithToken(
      endPoint: APIURL.GETCONTRATINFO,
    );
