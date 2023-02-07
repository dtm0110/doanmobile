// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      account: json['account'] as String?,
      username: json['username'] as String?,
      authenHash: json['authenHash'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      v: json['__v'] as int?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      height: (json['height'] as num?)?.toDouble(),
      weight: json['weight'] as int?,
      experience: json['experience'] as int?,
      highSchool: json['highSchool'] as String?,
      familyRecordBook: json['familyRecordBook'] as String?,
      identificationNumber: json['identificationNumber'] as String?,
      hobby: json['hobby'] as String?,
      characterUser: json['characterUser'] as String?,
      homeTown: json['homeTown'] as String?,
      educationLevel: json['educationLevel'] as String?,
      wish: json['wish'] as String?,
      career: json['career'] as String?,
      specialConditions: json['specialConditions'] as String?,
      salary: json['salary'] as int?,
      provinceId: json['provinceId'] as int?,
      currentAddress: json['currentAddress'] as String?,
      company: json['company'] as String?,
      image: json['image'] as String?,
      currentCareer: json['currentCareer'] as String?,
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      birthday: json['birthday'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone_number'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account);
  writeNotNull('username', instance.username);
  writeNotNull('authenHash', instance.authenHash);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('__v', instance.v);
  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('height', instance.height);
  writeNotNull('weight', instance.weight);
  writeNotNull('experience', instance.experience);
  writeNotNull('highSchool', instance.highSchool);
  writeNotNull('familyRecordBook', instance.familyRecordBook);
  writeNotNull('identificationNumber', instance.identificationNumber);
  writeNotNull('hobby', instance.hobby);
  writeNotNull('characterUser', instance.characterUser);
  writeNotNull('homeTown', instance.homeTown);
  writeNotNull('educationLevel', instance.educationLevel);
  writeNotNull('wish', instance.wish);
  writeNotNull('career', instance.career);
  writeNotNull('specialConditions', instance.specialConditions);
  writeNotNull('salary', instance.salary);
  writeNotNull('provinceId', instance.provinceId);
  writeNotNull('currentAddress', instance.currentAddress);
  writeNotNull('company', instance.company);
  writeNotNull('image', instance.image);
  writeNotNull('currentCareer', instance.currentCareer);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('name', instance.name);
  writeNotNull('age', instance.age);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('gender', instance.gender);
  writeNotNull('phone_number', instance.phone);
  writeNotNull('description', instance.description);
  return val;
}

AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    AccountRequest(
      account: json['account'] as String?,
      hash: json['hash'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AccountRequestToJson(AccountRequest instance) {
  final val = <String, dynamic>{
    'account': instance.account,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hash', instance.hash);
  writeNotNull('password', instance.password);
  return val;
}
