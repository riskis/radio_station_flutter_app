import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_station_test/features/app/routes.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_extra_entity.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/main_radio_station_bloc.dart';

import 'package:cached_network_image/cached_network_image.dart';

class MainRadioStationScreen extends StatelessWidget {
  const MainRadioStationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainRadioStationBloc, MainRadioStationState>(
      listener: (context, state) {
        if (state is MainRadioStationOnClickState) {
          context.go('/${AppRouter.radioPlay}',
              extra:
                  RadioStationExtraEntity(state.radioStations, state.position));
        }
      },
      builder: (context, state) {
        if (state is MainRadioStationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MainRadioStationErrorState) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state is MainRadioStationSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('MyRadio'),
            ),
            body: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: (state.radioStations)
                        .map((val) => _radioStationItem(
                            context,
                            state.radioStations,
                            state.radioStations.indexOf(val)))
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

Widget _radioStationItem(BuildContext context,
    List<RadioStationEntity> radioStations, int position) {
  return Material(
    elevation: 5.0,
    child: GestureDetector(
      onTap: () => BlocProvider.of<MainRadioStationBloc>(context)
          .add(MainRadioStationOnClickEvent(radioStations, position)),
      child: CachedNetworkImage(
        imageUrl: radioStations[position].favicon!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitWidth,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Text(
            "No Image",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
