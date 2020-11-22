import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class ListNotification {
  List<Notifications> notifications;

  ListNotification({this.notifications});
  factory ListNotification.fromJson(Map<String, dynamic> json) => _$ListNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationToJson(this);

}
@JsonSerializable(nullable: true, explicitToJson: true)
class Notifications {
  int notificationId;
  String notificationContext;
  String notificationCreatAt;
  int notificationPosterId;
  int notificationUserCreateId;
  String userCreateName;
  String isSeen;

  Notifications(
      {this.notificationId,
        this.notificationContext,
        this.notificationCreatAt,
        this.notificationPosterId,
        this.notificationUserCreateId,
        this.userCreateName,
        this.isSeen});
  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);

}
