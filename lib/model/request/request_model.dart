import 'package:json_annotation/json_annotation.dart';

part "request_model.g.dart";

@JsonSerializable()
class Request {
  String? type;
  String? query;
  String? language;

  Request({
    this.type,
    this.query,
    this.language,
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
