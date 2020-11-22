import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)

class Comment {
  int id;
  String urlAssets;
  UserCreate userCreate;
  String content;
  String create_at;
  List<Comments> comments;

  Comment(
      {this.id, this.create_at,this.urlAssets, this.userCreate, this.content, this.comments});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
@JsonSerializable(nullable: true)

class UserCreate {
  int id;
  String name;
  String genCode;
  bool gender;
  bool isBlock;
  String avatar;

  UserCreate({this.id, this.name, this.genCode, this.gender});

  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}
@JsonSerializable(nullable: true)

class Comments {
  int id;
  String content;
  String asset;
  UserCreate user;
  String createAt;

  Comments({this.id, this.content, this.asset, this.user, this.createAt});

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}