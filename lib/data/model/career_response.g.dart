// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerResponse _$CareerResponseFromJson(Map<String, dynamic> json) =>
    CareerResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Career.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$CareerResponseToJson(CareerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
