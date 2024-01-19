part of 'main_radio_station_bloc.dart';

abstract class MainRadioStationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainRadioStationGetCountryRadioStationEvent
    extends MainRadioStationEvent {}

class MainRadioStationOnClickEvent extends MainRadioStationEvent {
  final List<RadioStationEntity> radioStations;
  final int position;
  MainRadioStationOnClickEvent(this.radioStations, this.position);
}
