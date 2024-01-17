import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';

abstract class RadioStationRepository {
  Future<List<RadioStationEntity>> getRadioStationsByCountry(String country);
}
