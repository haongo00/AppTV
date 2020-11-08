import 'package:app_tv/routers/application.dart';

class SearchService {
  static Future<dynamic> getBookOrder(Map<String, dynamic> params) {
    return Application.api.get('/student/search/book/${params['id']}');
  }
}