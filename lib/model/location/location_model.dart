import 'package:json_annotation/json_annotation.dart';

part "location_model.g.dart";

@JsonSerializable()
class Location {
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  int? localtimeEpoch;
  String? utcOffset;

  Location(
      {this.name,
      this.country,
      this.region,
      this.lat,
      this.lon,
      this.timezoneId,
      this.localtime,
      this.localtimeEpoch,
      this.utcOffset});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}