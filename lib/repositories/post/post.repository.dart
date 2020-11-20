import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/services/post/post.service.dart';
import 'package:app_tv/utils/exception.dart';

class PostRepository {
  Future<ListPost> fetchListPost(Map<String, dynamic> params) async {
    final response = await PostService.getListPost(params);
    return (response.statusCode == 200)
        ? ListPost.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException;
  }
}