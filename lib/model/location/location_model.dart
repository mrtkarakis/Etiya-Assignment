// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart'
    show JsonKey, JsonSerializable;

part "location_model.g.dart";

@JsonSerializable()
class Location {
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  @JsonKey(name: 'timezone_id')
  String? timezoneId;
  String? localtime;
  @JsonKey(name: 'localtime_epoch')
  int? localtimeEpoch;
  @JsonKey(name: 'utc_offset')
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

  @override
  String toString() {
    return 'Location(name: $name, country: $country, region: $region, lat: $lat, lon: $lon, timezoneId: $timezoneId, localtime: $localtime, localtimeEpoch: $localtimeEpoch, utcOffset: $utcOffset)';
  }
}
