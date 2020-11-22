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


  Future<void> loadData() async {
    Map<String, dynamic> params = {
      "skip" : 0,
      "take" : 20
    };
    try {
      emit(NotificationLoading());
      ListNotification _list = await _notificationRepositories.fetchListMember(params);
      notifications = _list.notifications;
      print(notifications.length);
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