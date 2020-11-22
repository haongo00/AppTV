import 'package:app_tv/routers/application.dart';

class InforService {
  static Future<dynamic> getPost(Map<String, dynamic> params) {
    return Application.api.get('/poster/profile?take=${params['take']}&skip=${params['skip']}');
  }
  static Future<dynamic> resetPass(Map<String, dynamic> params) {
    return Application.api.put('/admin/changePassword',params);
  }

}