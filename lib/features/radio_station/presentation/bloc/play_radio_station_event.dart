part of 'play_radio_station_bloc.dart';

abstract class PlayRadioStationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayRadioStationInitialEvent extends PlayRadioStationEvent {
  final RadioStationExtraEntity radioStationExtra;
  PlayRadioStationInitialEvent(this.radioStationExtra);

  @override
  List<Object> get props => [radioStationExtra];
}

class PlayRadioStationPlayerPlayPauseEvent extends PlayRadioStationEvent {
  final RadioStationEntity radioStation;
  PlayRadioStationPlayerPlayPauseEvent(this.radioStation);
}

class PlayRadioStationPlayerResetEvent extends PlayRadioStationEvent {}

class PlayRadioStationMuteEvent extends PlayRadioStationEvent {}

class PlayRadioStationMaxVolumeEvent extends PlayRadioStationEvent {}

class PlayRadioStationVolumeChangeEvent extends PlayRadioStationEvent {
  final double actualVolume;
  PlayRadioStationVolumeChangeEvent(this.actualVolume);
}
