import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "name_en")
  String? nameEn;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "full_name_en")
  String? fullNameEn;

  Province({
    this.id,
    this.name,
    this.nameEn,
    this.fullName,
    this.fullNameEn,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}

@JsonSerializable()
class ProvinceResponse {
  @JsonKey(name: 'data')
  List<Province>? data;

  ProvinceResponse({this.data});

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
