import 'package:json_annotation/json_annotation.dart'
    show JsonKey, JsonSerializable;

part "current_model.g.dart";

@JsonSerializable()
class Current {
  @JsonKey(name: 'observation_time')
  String? observationTime;
  int? temperature;
  @JsonKey(name: 'weather_code')
  int? weatherCode;
  @JsonKey(name: 'weather_icons')
  List<String>? weatherIcons;

  @JsonKey(name: 'weather_descriptions')
  List<String>? weatherDescriptions;
  @JsonKey(name: 'wind_speed')
  int? windSpeed;
  @JsonKey(name: 'wind_degree')
  int? windDegree;
  @JsonKey(name: 'wind_dir')
  String? windDir;
  int? pressure;
  double? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
  @JsonKey(name: 'uv_index')
  int? uvIndex;
  int? visibility;
  String? isDay;

  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  String toString() {
    return 'Current(observationTime: $observationTime, temperature: $temperature, weatherCode: $weatherCode, weatherIcons: $weatherIcons, weatherDescriptions: $weatherDescriptions, windSpeed: $windSpeed, windDegree: $windDegree, windDir: $windDir, pressure: $pressure, precip: $precip, humidity: $humidity, cloudcover: $cloudcover, feelslike: $feelslike, uvIndex: $uvIndex, visibility: $visibility, isDay: $isDay)';
  }
}
