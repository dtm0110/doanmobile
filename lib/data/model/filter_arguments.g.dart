// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterArguments _$FilterArgumentsFromJson(Map<String, dynamic> json) =>
    FilterArguments(
      userId: json['user_id'] as int?,
      salary: json['salary'] as int?,
      age: json['age'] as int?,
      exp: json['experience'] as int?,
    )
      ..provinceId = json['province_id'] as int?
      ..search = json['search'] as String?;

Map<String, dynamic> _$FilterArgumentsToJson(FilterArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salary', instance.salary);
  writeNotNull('age', instance.age);
  writeNotNull('experience', instance.exp);
  writeNotNull('province_id', instance.provinceId);
  writeNotNull('search', instance.search);
  writeNotNull('user_id', instance.userId);
  return val;
}
