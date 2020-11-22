import 'package:app_tv/app/home/notification/notification.cubit.dart';
import 'package:app_tv/repositories/notification/notification.repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {

  NotificationCubit cubit = NotificationCubit(NotificationRepositories());


  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
    );
  }


}
