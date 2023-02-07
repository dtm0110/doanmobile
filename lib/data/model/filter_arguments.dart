import 'package:job_search/data/model/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_arguments.g.dart';

@JsonSerializable()
class FilterArguments {
  @JsonKey(name: 'salary', includeIfNull: false)
  int? salary;
  @JsonKey(name: 'age', includeIfNull: false)
  int? age;
  @JsonKey(name: 'experience', includeIfNull: false)
  int? exp;
  @JsonKey(name: 'province_id', includeIfNull: false)
  int? provinceId;
  @JsonKey(name: 'search', includeIfNull: false)
  String? search;
  @JsonKey(name: 'user_id', includeIfNull: false)
  int? userId;

  @JsonKey(ignore: true)
  Province? _province;

  set province(Province province) {
    _province = province;
    provinceId = province.id;
  }

  Province? get provinceData => _province;

  FilterArguments({
    this.userId,
    this.salary,
    this.age,
    this.exp,
  });

  factory FilterArguments.fromJson(Map<String, dynamic> json) =>
      _$FilterArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$FilterArgumentsToJson(this);
}
