// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RadioStationEntityImpl _$$RadioStationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RadioStationEntityImpl(
      name: json['name'] as String?,
      url: json['url'] as String?,
      radioUrl: json['url_resolved'] as String?,
      homepage: json['homepage'] as String?,
      favicon: json['favicon'] as String?,
      tags: json['tags'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      language: json['language'] as String?,
      votes: json['votes'] as int?,
    );

Map<String, dynamic> _$$RadioStationEntityImplToJson(
        _$RadioStationEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'url_resolved': instance.radioUrl,
      'homepage': instance.homepage,
      'favicon': instance.favicon,
      'tags': instance.tags,
      'country': instance.country,
      'state': instance.state,
      'language': instance.language,
      'votes': instance.votes,
    };
