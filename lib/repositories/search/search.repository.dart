import 'package:app_tv/model/book_order/book_order.dart';
import 'package:app_tv/services/search/search.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchRepository {
  Future<BookOrder> fetchBookOrder(Map<String, dynamic> params) async {
    final response = await SearchService.getBookOrder(params);
    return (response.statusCode == 200)
        ? BookOrder.fromJson(response.data['result'] as Map<String, dynamic>)
        : throw NetworkException;
  }

  Future<bool> createBookOrder(Map<String, dynamic> params) async {
    final response = await SearchService.newBookOrder(params);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }

  Future<bool> createBookOrderPay(Map<String, dynamic> params) async {
    final response = await SearchService.createBookPay(params);
    print(response);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }
}