// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    urlAssets: json['urlAssets'] as String,
    userCreate: json['userCreate'] == null
        ? null
        : UserCreate.fromJson(json['userCreate'] as Map<String, dynamic>),
    content: json['content'] as String,
    createAt: json['createAt'] as String,
    likes: json['likes'] as int,
    comments: json['comments'] as int,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'urlAssets': instance.urlAssets,
      'userCreate': instance.userCreate?.toJson(),
      'content': instance.content,
      'createAt': instance.createAt,
      'likes': instance.likes,
      'comments': instance.comments,
    };

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) {
  return UserCreate(
    id: json['id'] as int,
    name: json['name'] as String,
    department: json['department'] == null
        ? null
        : Department.fromJson(json['department'] as Map<String, dynamic>),
    avatar: json['avatar'] as String,
    genCode: json['genCode'] as String,
    gender: json['gender'] as bool,
  );
}

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'avatar': instance.avatar,
      'genCode': instance.genCode,
      'gender': instance.gender,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return Department(
    id: json['id'] as int,
    name: json['name'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
