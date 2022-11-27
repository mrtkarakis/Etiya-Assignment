import 'package:json_annotation/json_annotation.dart';

part "current_model.g.dart";

@JsonSerializable()
class Current {
  String? observationTime;
  int? temperature;
  int? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
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
