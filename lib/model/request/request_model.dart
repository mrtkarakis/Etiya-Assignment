// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

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

  @override
  String toString() =>
      'Request(type: $type, query: $query, language: $language)';
}
