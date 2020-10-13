import 'package:app_tv/routers/application.dart';

class AuthenticationService {
  static Future<dynamic> login(Map<String, dynamic> params) {
    return Application.api.post('/admin/login', params);
  }
}
