// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Major _$MajorFromJson(Map<String, dynamic> json) => Major(
      name: json['name'] as String?,
      id: json['id'] as int?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$MajorToJson(Major instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'isSelected': instance.isSelected,
    };
