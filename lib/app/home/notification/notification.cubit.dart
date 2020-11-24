import 'package:app_tv/model/notification/notification.dart';
import 'package:app_tv/repositories/notification/notification.repositories.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'notification.state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepositories _notificationRepositories;
  NotificationCubit(this._notificationRepositories) : super(NotificationInitial()){
    loadData();
  }
  List<Notifications> notifications;
  int tak = 10;
  void pull() {
    tak += 10;
    loadData(take: tak);
  }

  void reset() {
    tak = 10;
  }


  Future<void> loadData({int take = 10}) async {
    Map<String, dynamic> params = {
      "skip" : 0,
      "take" : take
    };
    try {
      emit(NotificationLoading());
      ListNotification _list = await _notificationRepositories.fetchListMember(params);
      notifications = _list.notifications;
      emit(ItemsNotificationLoaded(notifications));
    } on NetworkException {
      emit(NotificationError("Couldn't fetch data. Is the device online?"));
    }
  }
  Future<void> seenNotification(int _idNoti) async {
    Map<String, dynamic> params = {
      "id" : _idNoti
    };
    try {
       await _notificationRepositories.seenNotification(params);
       loadData();
    } on NetworkException {
      emit(NotificationError("Couldn't fetch data. Is the device online?"));
    }
  }

}