import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Post {
  int id;
  String urlAssets;
  UserCreate userCreate;
  String content;
  String createAt;
  int likes;
  int comments;

  Post(
      {this.id,
        this.urlAssets,
        this.userCreate,
        this.content,
        this.createAt,
        this.likes,
        this.comments});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(nullable: true)
class UserCreate {
  int id;
  String name;
  Department department;
  String avatar;
  String genCode;
  bool gender;

  UserCreate(
      {this.id,
        this.name,
        this.department,
        this.avatar,
        this.genCode,
        this.gender});

  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}

@JsonSerializable(nullable: true)
class Department {
  int id;
  String name;
  String code;

  Department({this.id, this.name, this.code});

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}