import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/presentation/bloc/play/play_radio_station_bloc.dart';
import 'package:volume_controller/volume_controller.dart';

//TODO add bloc state management for VolumeController
class RadioStationCard extends StatefulWidget {
  final RadioStationEntity radioStation;

  const RadioStationCard(this.radioStation, {Key? key}) : super(key: key);

  @override
  State<RadioStationCard> createState() => _RadioStationCardState();
}

class _RadioStationCardState extends State<RadioStationCard> {
  double _setVolumeValue = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // widget.player.play(UrlSource(widget.radioStation.radioUrl!));
    // widget.player.pause();
    // isPlaying = false;

    VolumeController().listener((volume) {
      setState(() => _setVolumeValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayRadioStationBloc, PlayRadioStationState>(
      listener: (context, state) {
        if (state is PlayRadioStationPlayerPlayingState ||
            state is PlayRadioStationPlayerPausedState) {
          setState(() {
            isPlaying = state is PlayRadioStationPlayerPlayingState;
          });
        }
      },
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CachedNetworkImage(
                  imageUrl: widget.radioStation.favicon ?? '',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                BlocProvider.of<PlayRadioStationBloc>(context)
                                    .add(PlayRadioStationPlayerPlayPauseEvent(
                                        widget.radioStation)),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(5),
                              backgroundColor: Colors.blue, // <-- Button color
                              foregroundColor: Colors.red, // <-- Splash color
                            ),
                            child: Icon(
                              isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    VolumeController().muteVolume(),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor:
                                      Colors.blue, // <-- Button color
                                  foregroundColor:
                                      Colors.red, // <-- Splash color
                                ),
                                child: const Icon(
                                  Icons.volume_mute_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              Slider(
                                min: 0,
                                max: 1,
                                onChanged: (double value) {
                                  setState(() {
                                    _setVolumeValue = value;
                                    VolumeController()
                                        .setVolume(_setVolumeValue);
                                  });
                                },
                                value: _setVolumeValue,
                              ),
                              ElevatedButton(
                                onPressed: () => VolumeController().maxVolume(),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor:
                                      Colors.blue, // <-- Button color
                                  foregroundColor:
                                      Colors.red, // <-- Splash color
                                ),
                                child: const Icon(
                                  Icons.volume_up_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.radioStation.name ?? 'Empty Radio Name',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.radioStation.country ?? 'Empty Country',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
