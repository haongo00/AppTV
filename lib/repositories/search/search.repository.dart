import 'package:app_tv/model/book_order/book_order.dart';
import 'package:app_tv/services/search/search.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:flutter/material.dart';

class SearchRepository {
  Future<BookOrder> fetchBookOrder(Map<String, dynamic> params) async {
    final response = await SearchService.getBookOrder(params);
    return (response.statusCode == 200)
        ? BookOrder.fromJson(response.data['result'] as Map<String, dynamic>)
        : throw NetworkException;
  }

  Future<bool> createBookOrder(Map<String, dynamic> params) async {
    final response = await SearchService.newBookOrder(params);
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }
}