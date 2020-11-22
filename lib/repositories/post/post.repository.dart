import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/services/post/post.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:app_tv/model/comment/comment.dart';



class PostRepository {
  Future<ListPost> fetchListPost(Map<String, dynamic> params) async {
    final response = await PostService.getListPost(params);
    return (response.statusCode == 200)
        ? ListPost.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException;
  }
  Future<Comment> fetchPost(Map<String, dynamic> params) async {
    final response = await PostService.getPost(params);
    print(response.data['result'].toString());
    return (response.statusCode == 200)
        ? Comment.fromJson(response.data['result'] as Map<String, dynamic>)
        : throw NetworkException;
  }
  Future<bool> deletePost(Map<String, dynamic> params) async {
    final response = await PostService.deletePost(params);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }
}