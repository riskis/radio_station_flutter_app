import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:radio_station_test/core/di/service_locator.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/usecase/get_country_radio_station_usecase.dart';

part 'main_radio_station_event.dart';
part 'main_radio_station_state.dart';

class MainRadioStationBloc
    extends Bloc<MainRadioStationEvent, MainRadioStationState> {
  MainRadioStationBloc() : super(MainRadioStationInitialState()) {
    on<MainRadioStationGetCountryRadioStationEvent>(
        mainRadioStationGetRadioStationEvent);
    on<MainRadioStationOnClickEvent>(mainRadioStationOnClickEvent);
  }

  FutureOr<void> mainRadioStationGetRadioStationEvent(
      MainRadioStationGetCountryRadioStationEvent event,
      Emitter<MainRadioStationState> emit) async {
    try {
      emit(MainRadioStationLoadingState());
      List<RadioStationEntity> radioStations =
          await serviceLocator<GetCountryRadioStationUseCase>().call();
      emit(MainRadioStationSuccessState(radioStations));
    } catch (e) {
      emit(MainRadioStationErrorState('Something went wrong'));
    }
  }

  FutureOr<void> mainRadioStationOnClickEvent(
      MainRadioStationOnClickEvent event, Emitter<MainRadioStationState> emit) {
    emit(MainRadioStationOnClickState(event.radioStations, event.position));
  }
}
