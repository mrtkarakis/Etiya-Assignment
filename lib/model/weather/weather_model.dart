// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

import 'package:etiya_assignment/model/current/current_model.dart';
import 'package:etiya_assignment/model/location/location_model.dart';
import 'package:etiya_assignment/model/request/request_model.dart';

part "weather_model.g.dart";

@JsonSerializable()
class Weather {
  Request? request;
  Location? location;
  Current? current;

  Weather({
    this.request,
    this.location,
    this.current,
  });

  factory Weather.fromJson(Map<String, dynamic>? json) =>
      _$WeatherFromJson(json ?? {});
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  String toString() =>
      'Weather(request: $request, location: $location, current: $current)';
}
