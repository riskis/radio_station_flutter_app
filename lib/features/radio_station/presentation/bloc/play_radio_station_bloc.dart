import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_extra_entity.dart';

part 'play_radio_station_event.dart';
part 'play_radio_station_state.dart';

class PlayRadioStationBloc
    extends Bloc<PlayRadioStationEvent, PlayRadioStationState> {
  AudioPlayer? player;
  bool _isPlaying = false;

  PlayRadioStationBloc() : super(PlayRadioStationInitialState()) {
    on<PlayRadioStationInitialEvent>(playRadioStationInitialEvent);
    on<PlayRadioStationPlayerResetEvent>(playRadioStationPlayerResetEvent);
    on<PlayRadioStationPlayerPlayPauseEvent>(
        playRadioStationPlayerPlayPauseEvent);
  }

  FutureOr<void> playRadioStationInitialEvent(
      PlayRadioStationInitialEvent event, Emitter<PlayRadioStationState> emit) {
    resetPlayer();
    // TODO create radioStationsList starting by currentPosition
  }

  FutureOr<void> playRadioStationPlayerResetEvent(
      PlayRadioStationPlayerResetEvent event,
      Emitter<PlayRadioStationState> emit) {
    resetPlayer();
    emit(PlayRadioStationPlayerPausedState());
  }

  FutureOr<void> playRadioStationPlayerPlayPauseEvent(
      PlayRadioStationPlayerPlayPauseEvent event,
      Emitter<PlayRadioStationState> emit) {
    if (null != event.radioStation.radioUrl &&
        event.radioStation.radioUrl!.isNotEmpty) {
      if (_isPlaying) {
        player?.pause();
        _isPlaying = false;
      } else {
        if (null != player) {
          player?.resume();
        } else {
          player = AudioPlayer();
          player?.play(UrlSource(event.radioStation.radioUrl!));
        }
        _isPlaying = true;
      }
    }
    emit(_isPlaying
        ? PlayRadioStationPlayerPlayingState()
        : PlayRadioStationPlayerPausedState());
  }

  void resetPlayer() {
    player?.dispose();
    player = null;
    _isPlaying = false;
  }
}
