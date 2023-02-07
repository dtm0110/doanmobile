import 'package:job_search/data/model/major.dart';
import 'package:json_annotation/json_annotation.dart';


part 'major_response.g.dart';

@JsonSerializable()
class MajorResponse {
  @JsonKey(name: "data")
  List<Major>? data;

  @JsonKey(name: "total")
  int? total;

  MajorResponse({this.data, this.total});

  factory MajorResponse.fromJson(Map<String, dynamic> json) =>
      _$MajorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MajorResponseToJson(this);
}
