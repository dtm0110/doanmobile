import 'package:json_annotation/json_annotation.dart';

part 'major.g.dart';

@JsonSerializable()
class Major {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "isSelected")
  bool? isSelected;
  Major({
    this.name,
    this.id,
    this.isSelected = false
  });

  factory Major.fromJson(Map<String, dynamic> json) =>
      _$MajorFromJson(json);

  Map<String, dynamic> toJson() => _$MajorToJson(this);
}