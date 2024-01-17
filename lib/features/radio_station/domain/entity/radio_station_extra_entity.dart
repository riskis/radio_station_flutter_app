import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';

class RadioStationExtraEntity {
  final List<RadioStationEntity> radioStations;
  final int position;
  RadioStationExtraEntity(this.radioStations, this.position);

  factory RadioStationExtraEntity.fromExtraObject(Object? extra) => extra as RadioStationExtraEntity;
}