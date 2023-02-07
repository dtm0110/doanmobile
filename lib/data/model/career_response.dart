import 'package:job_search/data/model/career.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_response.g.dart';

@JsonSerializable()
class CareerResponse {
  @JsonKey(name: "data")
  List<Career>? data;

  @JsonKey(name: "total")
  int? total;

  CareerResponse({this.data, this.total});

  factory CareerResponse.fromJson(Map<String, dynamic> json) =>
      _$CareerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CareerResponseToJson(this);
}
