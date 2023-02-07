// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorResponse _$MajorResponseFromJson(Map<String, dynamic> json) =>
    MajorResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Major.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MajorResponseToJson(MajorResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
