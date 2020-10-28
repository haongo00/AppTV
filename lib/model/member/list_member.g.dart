// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMember _$ListMemberFromJson(Map<String, dynamic> json) {
  return ListMember(
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListMemberToJson(ListMember instance) =>
    <String, dynamic>{
      'result': instance.result?.map((e) => e?.toJson())?.toList(),
    };

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    id: json['id'] as int,
    name: json['name'] as String,
    userName: json['userName'] as String,
    role: json['role'] as String,
    department: json['department'] as String,
    born: json['born'] as int,
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userName': instance.userName,
      'role': instance.role,
      'department': instance.department,
      'born': instance.born,
      'avatar': instance.avatar,
    };
