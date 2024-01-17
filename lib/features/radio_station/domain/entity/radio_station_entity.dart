// ignore_for_file: invalid_annotation_target

import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'radio_station_entity.freezed.dart';
part 'radio_station_entity.g.dart';

@freezed
class RadioStationEntity with _$RadioStationEntity {
  const factory RadioStationEntity({
    String? name,
    String? url,
    @JsonKey(name: 'url_resolved') String? radioUrl,
    String? homepage,
    String? favicon,
    String? tags,
    String? country,
    String? state,
    String? language,
    int? votes,
  }) = _RadioStationEntity;

  factory RadioStationEntity.fromJson(Map<String, Object?> json) =>
      _$RadioStationEntityFromJson(json);
}
