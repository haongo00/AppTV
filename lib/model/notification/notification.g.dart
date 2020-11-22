// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotification _$ListNotificationFromJson(Map<String, dynamic> json) {
  return ListNotification(
    notifications: (json['notifications'] as List)
        ?.map((e) => e == null
            ? null
            : Notifications.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListNotificationToJson(ListNotification instance) =>
    <String, dynamic>{
      'notifications':
          instance.notifications?.map((e) => e?.toJson())?.toList(),
    };

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return Notifications(
    notificationId: json['notificationId'] as int,
    notificationContext: json['notificationContext'] as String,
    notificationCreatAt: json['notificationCreatAt'] as String,
    notificationPosterId: json['notificationPosterId'] as int,
    notificationUserCreateId: json['notificationUserCreateId'] as int,
    userCreateName: json['userCreateName'] as String,
    isSeen: json['isSeen'] as String,
  );
}

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationContext': instance.notificationContext,
      'notificationCreatAt': instance.notificationCreatAt,
      'notificationPosterId': instance.notificationPosterId,
      'notificationUserCreateId': instance.notificationUserCreateId,
      'userCreateName': instance.userCreateName,
      'isSeen': instance.isSeen,
    };
