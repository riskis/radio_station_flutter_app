import 'package:radio_station_test/features/radio_station/data/api/radio_station_api.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/repository/radio_station_repository.dart';

class RadioStationRepositoryImpl implements RadioStationRepository {
  final RadioStationApi radioStationApi;

  RadioStationRepositoryImpl({required this.radioStationApi});

  @override
  Future<List<RadioStationEntity>> getRadioStationsByCountry(String country) {
    return radioStationApi.getRadioStationsByCountry(country);
  }
}
