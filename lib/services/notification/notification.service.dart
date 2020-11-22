import 'package:app_tv/routers/application.dart';

class NotificationService {
  static Future<dynamic> getListNotification(Map<String, dynamic> params) {
    return Application.api.get('/poster/notifications/skip=${params['skip']}&take=${params['take']}');
  }
}