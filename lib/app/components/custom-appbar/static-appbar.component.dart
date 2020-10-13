import 'package:flutter/material.dart';

AppBar staticAppbar({String title, PreferredSize bottomWidget, List<Widget> action, bool containBackButton = false}) =>
    AppBar(
      leading: containBackButton ? const BackButton() : null,
      backgroundColor: Colors.transparent,
      flexibleSpace: const Image(
        image: AssetImage('assets/images/appbar/16.png'),
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      centerTitle: true,
      bottom: bottomWidget,
      actions: action,
    );
