import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/repository/radio_station_repository.dart';

class GetCountryRadioStationUseCase {
  final RadioStationRepository radioStationRepositoryImpl;
  final String country;

  GetCountryRadioStationUseCase(this.radioStationRepositoryImpl, this.country);

  Future<List<RadioStationEntity>> call() async {
    return radioStationRepositoryImpl.getRadioStationsByCountry(country);
  }
}
