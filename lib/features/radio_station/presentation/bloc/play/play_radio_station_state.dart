part of 'play_radio_station_bloc.dart';

abstract class PlayRadioStationState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayRadioStationInitialState extends PlayRadioStationState {}

class PlayRadioStationPlayerSuccessState extends PlayRadioStationState {}

class PlayRadioStationPlayerPlayingState extends PlayRadioStationState {}

class PlayRadioStationPlayerPausedState extends PlayRadioStationState {}

class PlayRadioStationVolumeChangeState extends PlayRadioStationState {
  final double actualVolume;
  PlayRadioStationVolumeChangeState(this.actualVolume);

  @override
  List<Object> get props => [actualVolume];
}
