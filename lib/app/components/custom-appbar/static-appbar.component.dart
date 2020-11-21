import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/material.dart';

AppBar staticAppbar({String title, PreferredSize bottomWidget, List<Widget> action, bool containBackButton = false}) =>
    AppBar(
      leading: BackButton(
        color: Color(0xff068189),
      ),
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 13.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xff068189)),
          child: Text("$title")),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: bottomWidget,
      actions: action,
    );
