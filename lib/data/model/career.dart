import 'package:job_search/extension/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career.g.dart';

@JsonSerializable()
class Career {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "career_id")
  int? careerId;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "amount")
  int? amount;

  @JsonKey(name: "salary")
  int? salary;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "gender")
  String? gender;

  @JsonKey(name: "start_age")
  int? startAge;

  @JsonKey(name: "end_age")
  int? endAge;

  @JsonKey(name: "english_level")
  int? englishLevel;

  @JsonKey(name: "experience")
  int? experience;

  @JsonKey(name: "contact")
  String? contact;

  @JsonKey(name: "province_name")
  String? provinceName;

  @JsonKey(name: "company_id")
  int? companyId;

  @JsonKey(name: "apply")
  bool? apply;

  @JsonKey(name: "saved")
  bool? saved;

  @JsonKey(name: "company_name")
  String? companyName;

  @JsonKey(name: "province_id")
  int? provinceId;

  @JsonKey(name: "created_time")
  String? createdTime;

  @JsonKey(name: "updated_time")
  String? updatedTime;

  Career({
    this.id,
    this.careerId,
    this.name,
    this.description,
    this.amount,
    this.salary,
    this.address,
    this.gender,
    this.startAge,
    this.endAge,
    this.englishLevel,
    this.experience,
    this.contact,
    this.provinceName,
    this.companyId,
    this.apply,
    this.saved,
    this.companyName,
    this.provinceId,
    this.createdTime,
    this.updatedTime,
  });

  String get createDateFormatted =>
      createdTime?.convertDateFormat(
          'yyyy-MM-ddTHH:mm:ss.sssZ', 'HH:mm:ss dd/MM/yyyy') ??
      'Unknown';

  factory Career.fromJson(Map<String, dynamic> json) => _$CareerFromJson(json);

  Map<String, dynamic> toJson() => _$CareerToJson(this);
}
