import 'package:app_tv/routers/application.dart';

class PostService {
  static Future<dynamic> getListPost(Map<String, dynamic> params) {
    return Application.api.get('/poster/skip=${params['skip']}&&take=${params['take']}');
  }
  static Future<dynamic> getPost(Map<String, dynamic> params) {
    return Application.api.get('/poster/comment/${params['idPost']}');
  }
  static Future<dynamic> deletePost(Map<String, dynamic> params) {
    return Application.api.delete('/poster/${params['idPost']}');
  }
}