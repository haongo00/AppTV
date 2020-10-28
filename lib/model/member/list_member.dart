import 'package:json_annotation/json_annotation.dart';

part 'list_member.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class ListMember {
  List<Member> result;

  ListMember({this.result});

  factory ListMember.fromJson(Map<String, dynamic> json) => _$ListMemberFromJson(json);

  Map<String, dynamic> toJson() => _$ListMemberToJson(this);
}

@JsonSerializable(nullable: true)
class Member {
  int id;
  String name;
  String userName;
  String role;
  String department;
  int born;
  String avatar;

  Member({this.id, this.name, this.userName, this.role, this.department, this.born, this.avatar});

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
