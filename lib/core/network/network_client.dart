import 'dart:io';

import 'package:dio/dio.dart';
import 'package:radio_station_test/core/shared/constants.dart';

class NetworkClient {
  final Dio _dio;
  final Constant constant;
  NetworkClient(this._dio, {required this.constant}) {
    _dio.options = BaseOptions(baseUrl: constant.apiBaseUrl, headers: {
      'User-Agent': 'radioStationFlutterApp/v1.0',
      HttpHeaders.contentTypeHeader: "application/json",
    });
  }

  get dio => _dio;
}
