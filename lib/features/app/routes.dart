import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_station_test/core/di/service_locator.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_extra_entity.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/main_radio_station_bloc.dart';
import 'package:radio_station_test/features/radio_station/presentation/main_radio_station_screen/main_radio_station_screen.dart';
import 'package:radio_station_test/features/radio_station/presentation/radio_station_play_screen/radio_station_play_screen.dart';

class AppRouter {
  static const home = '/';
  static const radioPlay = 'radioPlay';

  GoRouter generateRoute() {
    return GoRouter(routes: <RouteBase>[
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) {
          return BlocProvider.value(
            value: serviceLocator<MainRadioStationBloc>()
              ..add(MainRadioStationGetCountryRadioStationEvent()),
            child: const MainRadioStationScreen(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
              path: AppRouter.radioPlay,
              builder: (context, state) {
                final MainRadioStationBloc radioStationBloc =
                    serviceLocator<MainRadioStationBloc>();

                return BlocProvider.value(
                  value: radioStationBloc
                    ..add(MainRadioStationGetCountryRadioStationEvent()),
                  child: RadioStationPlayScreen(
                      extraEntity: state.extra as RadioStationExtraEntity),
                );
              }),
        ],
      ),
    ]);
  }
}
