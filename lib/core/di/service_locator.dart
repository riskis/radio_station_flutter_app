import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_station_test/core/network/network_client.dart';
import 'package:radio_station_test/core/shared/constants.dart';
import 'package:radio_station_test/features/radio_station/data/api/radio_station_api.dart';
import 'package:radio_station_test/features/radio_station/data/repository/radio_station_repository_impl.dart';
import 'package:radio_station_test/features/radio_station/domain/repository/radio_station_repository.dart';
import 'package:radio_station_test/features/radio_station/domain/usecase/get_country_radio_station_usecase.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/main/main_radio_station_bloc.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/play/play_radio_station_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
    () => NetworkClient(Dio(), constant: serviceLocator()).dio,
  );

  // Radio Station
  serviceLocator
      .registerFactory<MainRadioStationBloc>(() => MainRadioStationBloc());
  serviceLocator.registerLazySingleton<RadioStationApi>(
      () => RadioStationApi(dio: serviceLocator()));
  serviceLocator.registerLazySingleton<RadioStationRepository>(
      () => RadioStationRepositoryImpl(radioStationApi: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetCountryRadioStationUseCase(serviceLocator(), 'es'));

  // Radio Station Play
  serviceLocator
      .registerFactory<PlayRadioStationBloc>(() => PlayRadioStationBloc());
}
