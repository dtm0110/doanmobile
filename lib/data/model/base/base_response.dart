import 'package:job_search/extension/string_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseResponse<T> {

  @JsonKey(name: "error_code")
  String? errorCode;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  T? data;

  BaseResponse({this.errorCode, this.message, this.data});

  bool get success => errorCode.emptyOrNull;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
