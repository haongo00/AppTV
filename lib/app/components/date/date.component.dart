import 'package:flutter/material.dart';

String dateFormat(String date) {
  return (date == "") ? "" : "${DateTime.parse(date).day} - ${DateTime.parse
    (date)
      .month}"
      " - ${DateTime.parse(date).year}";
}
