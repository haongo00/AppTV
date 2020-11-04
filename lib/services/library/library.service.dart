import 'package:app_tv/routers/application.dart';

class LibraryService {
  static Future<dynamic> getListBook(Map<String, dynamic> params) {
    return Application.api.get('/book');
  }

  static Future<dynamic> getListMember(Map<String, dynamic> params) {
    return Application.api.get('/user');
  }

  static Future<dynamic> createBook(Map<String, dynamic> params) {
    return Application.api.post('/book/create', params);
  }

  static Future<dynamic> getBookInfo(Map<String, dynamic> params, int id) {
    return Application.api.get('/book/$id', params);
  }

  static Future<dynamic> editBookInfo(Map<String, dynamic> params) {
    return Application.api.put('/book/', params);
  }

}
