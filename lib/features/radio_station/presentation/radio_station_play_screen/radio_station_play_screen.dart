import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_entity.dart';
import 'package:radio_station_test/features/radio_station/domain/entity/radio_station_extra_entity.dart';
import 'package:radio_station_test/features/radio_station/presentation/radio_station_play_screen/radio_station_card.dart';

class RadioStationPlayScreen extends StatefulWidget {
  final RadioStationExtraEntity extraEntity;

  const RadioStationPlayScreen({Key? key, required this.extraEntity})
      : super(key: key);

  @override
  State<RadioStationPlayScreen> createState() => _RadioStationPlayScreenState();
}

class _RadioStationPlayScreenState extends State<RadioStationPlayScreen> {
  final CardSwiperController controller = CardSwiperController();
  int currentCardIndex = 0;
  List<RadioStationCard> cards = [];

  @override
  void initState() {
    super.initState();
    currentCardIndex = widget.extraEntity.position;
    if (null != widget.extraEntity.radioStations) {
      cards =
          widget.extraEntity.radioStations!.map(RadioStationCard.new).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Flexible(
        child: CardSwiper(
          controller: controller,
          cardsCount: cards.length,
          onSwipe: _onSwipe,
          onUndo: _onUndo,
          numberOfCardsDisplayed: 3,
          backCardOffset: const Offset(40, 40),
          padding: const EdgeInsets.all(24.0),
          cardBuilder: (
            context,
            index,
            horizontalThresholdPercentage,
            verticalThresholdPercentage,
          ) =>
              cards[index],
          initialIndex: currentCardIndex,
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (null != currentIndex) {
      cards[currentIndex].initCard();
    }
    cards[previousIndex].disposeCard();
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    return false;
  }
}
