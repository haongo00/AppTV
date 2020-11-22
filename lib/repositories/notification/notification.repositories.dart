import 'package:app_tv/model/notification/notification.dart';
import 'package:app_tv/services/notification/notification.service.dart';
import 'package:app_tv/utils/exception.dart';

class NotificationRepositories {
  Future<ListNotification> fetchListMember(Map<String, dynamic> params) async {
    final response = await NotificationService.getListNotification(params);
    print(response);
    return (response.statusCode == 200)
        ? ListNotification.fromJson(response.data['result'] as Map<String, dynamic>)
        : throw NetworkException;
  }
}