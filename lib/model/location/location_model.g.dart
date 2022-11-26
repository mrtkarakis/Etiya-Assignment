// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      timezoneId: json['timezoneId'] as String?,
      localtime: json['localtime'] as String?,
      localtimeEpoch: json['localtimeEpoch'] as int?,
      utcOffset: json['utcOffset'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'region': instance.region,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezoneId': instance.timezoneId,
      'localtime': instance.localtime,
      'localtimeEpoch': instance.localtimeEpoch,
      'utcOffset': instance.utcOffset,
    };
