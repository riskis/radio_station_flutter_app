part of 'main_radio_station_bloc.dart';

abstract class MainRadioStationState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainRadioStationInitialState extends MainRadioStationState {}

class MainRadioStationLoadingState extends MainRadioStationState {}

class MainRadioStationSuccessState extends MainRadioStationState {
  final List<RadioStationEntity> radioStations;
  MainRadioStationSuccessState(this.radioStations);

  @override
  List<Object> get props => [radioStations];
}

class MainRadioStationErrorState extends MainRadioStationState {
  final String message;
  MainRadioStationErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class MainRadioStationOnClickState extends MainRadioStationState {
  final List<RadioStationEntity> radioStations;
  final int position;
  MainRadioStationOnClickState(this.radioStations, this.position);

  @override
  List<Object> get props => [radioStations];
}
