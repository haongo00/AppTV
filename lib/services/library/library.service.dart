import 'package:app_tv/routers/application.dart';

class LibraryService {
  static Future<dynamic> getListBook(Map<String, dynamic> params) {
    return Application.api.get('/book/skip=${params['skip']}&take=${params['take']}');
  }

  static Future<dynamic> getListMember(Map<String, dynamic> params) {
    return Application.api.get('/user/skip=${params['skip']}&take=${params['take']}');
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

  static Future<dynamic> getRole(Map<String, dynamic> params) {
    return Application.api.get('/user/role');
  }
  static Future<dynamic> getDepartment(Map<String, dynamic> params) {
    return Application.api.get('/user/department');
  }

  static Future<dynamic> deleteBook(Map<String, dynamic> params) {
    return Application.api.delete('/book/RemoveById/idBook=${params['idBook']}');
  }
  static Future<dynamic> createUser(Map<String, dynamic> params) {
    return Application.api.post('/user/create', params);
  }
}
