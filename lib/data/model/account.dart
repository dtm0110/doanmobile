import 'package:job_search/features/authentication/profile/profile_view.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: "account", includeIfNull: false)
  String? account;
  @JsonKey(name: "username", includeIfNull: false)
  String? username;
  @JsonKey(name: "authenHash", includeIfNull: false)
  String? authenHash;
  @JsonKey(name: "created_at", includeIfNull: false)
  String? createdAt;
  @JsonKey(name: "updated_at", includeIfNull: false)
  String? updatedAt;
  @JsonKey(name: "__v", includeIfNull: false)
  int? v;
  @JsonKey(name: "id", includeIfNull: false)
  int? id;
  @JsonKey(name: "user_id", includeIfNull: false)
  int? userId;
  @JsonKey(name: "height", includeIfNull: false)
  double? height;
  @JsonKey(name: "weight", includeIfNull: false)
  int? weight;
  @JsonKey(name: "experience", includeIfNull: false)
  int? experience;
  @JsonKey(name: "highSchool", includeIfNull: false)
  String? highSchool;
  @JsonKey(name: "familyRecordBook", includeIfNull: false)
  String? familyRecordBook;
  @JsonKey(name: "identificationNumber", includeIfNull: false)
  String? identificationNumber;
  @JsonKey(name: "hobby", includeIfNull: false)
  String? hobby;
  @JsonKey(name: "characterUser", includeIfNull: false)
  String? characterUser;
  @JsonKey(name: "homeTown", includeIfNull: false)
  String? homeTown;
  @JsonKey(name: "educationLevel", includeIfNull: false)
  String? educationLevel;
  @JsonKey(name: "wish", includeIfNull: false)
  String? wish;
  @JsonKey(name: "career", includeIfNull: false)
  String? career;
  @JsonKey(name: "specialConditions", includeIfNull: false)
  String? specialConditions;
  @JsonKey(name: "salary", includeIfNull: false)
  int? salary;
  @JsonKey(name: "provinceId", includeIfNull: false)
  int? provinceId;
  @JsonKey(name: "currentAddress", includeIfNull: false)
  String? currentAddress;
  @JsonKey(name: "company", includeIfNull: false)
  String? company;
  @JsonKey(name: "image", includeIfNull: false)
  String? image;
  @JsonKey(name: "currentCareer", includeIfNull: false)
  String? currentCareer;
  @JsonKey(name: "uuid", includeIfNull: false)
  String? uuid;
  @JsonKey(name: "name", includeIfNull: false)
  String? name;
  @JsonKey(name: "age", includeIfNull: false)
  int? age;
  @JsonKey(name: "birthday", includeIfNull: false)
  String? birthday;
  @JsonKey(name: "gender", includeIfNull: false)
  String? gender;
  @JsonKey(name: "phone_number", includeIfNull: false)
  String? phone;
  @JsonKey(name: "description", includeIfNull: false)
  String? description;

  Account({
    this.account,
    this.username,
    this.authenHash,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
    this.userId,
    this.height,
    this.weight,
    this.experience,
    this.highSchool,
    this.familyRecordBook,
    this.identificationNumber,
    this.hobby,
    this.characterUser,
    this.homeTown,
    this.educationLevel,
    this.wish,
    this.career,
    this.specialConditions,
    this.salary,
    this.provinceId,
    this.currentAddress,
    this.company,
    this.image,
    this.currentCareer,
    this.uuid,
    this.name,
    this.age,
    this.birthday,
    this.gender,
    this.phone,
    this.description,
  });

  Account getUpdateCVRequest() {
    return Account(
      userId: userId ?? id,
      height: height,
      weight: weight,
      familyRecordBook: familyRecordBook,
      identificationNumber: identificationNumber,
      hobby: hobby,
      characterUser: characterUser,
      homeTown: homeTown,
      educationLevel: educationLevel,
      career: career,
      salary: salary,
      provinceId: provinceId,
      currentAddress: currentAddress,
      company: company,
      currentCareer: currentCareer,
      experience: experience,
      phone: phone,
      description: description,
    );
  }

  Account getUserUpdate() {
    return Account(
      userId: userId ?? id,
      name: name,
      age: age,
      birthday: birthday,
      gender: gender,
    );
  }

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  SingingCharacter? genderEnum() => gender?.toLowerCase() == 'male'
      ? SingingCharacter.male
      : SingingCharacter.female;

  String getEmail() => username ?? account ?? '';
}

@JsonSerializable()
class AccountRequest {
  @JsonKey(name: "account")
  String? account;
  @JsonKey(name: "hash", includeIfNull: false)
  String? hash;
  @JsonKey(name: "password", includeIfNull: false)
  String? password;

  AccountRequest({
    this.account,
    this.hash,
    this.password,
  });

  factory AccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRequestToJson(this);
}
