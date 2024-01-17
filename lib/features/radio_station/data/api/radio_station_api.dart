import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';

class RadioStationApi {
  final Dio dio;

  RadioStationApi({required this.dio});

  Future<List<RadioStationEntity>> getRadioStationsByCountry(
      String country) async {
    var params = {
      'order': 'votes',
      'limit': 60,
      'hidebroken': true,
    };
    final res = await dio.post('/json/stations/bycountry/$country',
        data: jsonEncode(params));

    final radioStationsList = List<Map<String, dynamic>>.from(res.data)
        .map((e) => RadioStationEntity.fromJson(e))
        .toList();
    radioStationsList.removeWhere(
        (element) => null == element.favicon || element.favicon!.isEmpty);

    return radioStationsList;
  }
}
