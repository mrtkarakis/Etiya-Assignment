// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      type: json['type'] as String?,
      query: json['query'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'language': instance.language,
    };
