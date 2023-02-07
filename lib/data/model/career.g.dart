// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Career _$CareerFromJson(Map<String, dynamic> json) => Career(
      id: json['id'] as int?,
      careerId: json['career_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as int?,
      salary: json['salary'] as int?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      startAge: json['start_age'] as int?,
      endAge: json['end_age'] as int?,
      englishLevel: json['english_level'] as int?,
      experience: json['experience'] as int?,
      contact: json['contact'] as String?,
      provinceName: json['province_name'] as String?,
      companyId: json['company_id'] as int?,
      apply: json['apply'] as bool?,
      saved: json['saved'] as bool?,
      companyName: json['company_name'] as String?,
      provinceId: json['province_id'] as int?,
      createdTime: json['created_time'] as String?,
      updatedTime: json['updated_time'] as String?,
    );

Map<String, dynamic> _$CareerToJson(Career instance) => <String, dynamic>{
      'id': instance.id,
      'career_id': instance.careerId,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'salary': instance.salary,
      'address': instance.address,
      'gender': instance.gender,
      'start_age': instance.startAge,
      'end_age': instance.endAge,
      'english_level': instance.englishLevel,
      'experience': instance.experience,
      'contact': instance.contact,
      'province_name': instance.provinceName,
      'company_id': instance.companyId,
      'apply': instance.apply,
      'saved': instance.saved,
      'company_name': instance.companyName,
      'province_id': instance.provinceId,
      'created_time': instance.createdTime,
      'updated_time': instance.updatedTime,
    };
