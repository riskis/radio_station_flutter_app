import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:radio_station_test/core/network/network_client.dart';
import 'package:radio_station_test/core/shared/constants.dart';
import 'package:radio_station_test/features/radio_station/data/api/radio_station_api.dart';
import 'package:radio_station_test/features/radio_station/data/repository/radio_station_repository_impl.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/usecase/get_country_radio_station_usecase.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/main/main_radio_station_bloc.dart';
import 'package:radio_station_test/features/radio_station/presentation/main_radio_station_screen/main_radio_station_screen.dart';

import 'main_radio_station_widget_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([Dio, MainRadioStationBloc, RadioStationApi, GetCountryRadioStationUseCase])
void main() {
  group('Main Radio Station Screen', () {
    late RadioStationRepositoryImpl radioStationRepositoryImpl;
    late GetCountryRadioStationUseCase getCountryRadioStationUseCase;
    late MainRadioStationBloc mainRadioStationBloc;
    late List<RadioStationEntity> radioStations;
    setUp(() {
      radioStationRepositoryImpl =
          RadioStationRepositoryImpl(radioStationApi: MockRadioStationApi());
      getCountryRadioStationUseCase =
          GetCountryRadioStationUseCase(radioStationRepositoryImpl, 'es');
      mainRadioStationBloc = MockMainRadioStationBloc();
      getCountryRadioStationUseCase.call().then((value) {
        radioStations = value;
      });
      when(() => );
    });
    group('Bloc Events', () {
      testWidgets('Bloc Get Radio Stations and Click Events', (tester) async {
        await tester.pumpWidget(
          BlocProvider.value(
            value: mainRadioStationBloc,
            child: const MaterialApp(home: MainRadioStationScreen()),
          ),
        );
        verify(() => mainRadioStationBloc
            .add(MainRadioStationGetCountryRadioStationEvent())).called(1);
        expect(find.byType(Material), findsOneWidget);
        await tester.tap(find.byType(GestureDetector));
        verify(() => mainRadioStationBloc
            .add(MainRadioStationOnClickEvent(radioStations, 0))).called(1);
      });
    });
  });
}
