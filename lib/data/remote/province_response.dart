import 'package:json_annotation/json_annotation.dart';

import '../model/province.dart';

part 'province_response.g.dart';

@JsonSerializable()
class ProvinceResponse {
  @JsonKey(name: "data")
  List<Province>? data;

  @JsonKey(name: "total")
  int? total;

  ProvinceResponse({this.data, this.total});

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
