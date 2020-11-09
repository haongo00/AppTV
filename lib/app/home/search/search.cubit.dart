import 'package:app_tv/model/book_order/book_order.dart';
import 'package:app_tv/model/book_order/book_order_info.dart';
import 'package:app_tv/repositories/search/search.repository.dart';
import 'package:app_tv/services/search/search.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'search.state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit(this._searchRepository) : super(SearchInitial()) {
    getBookOrderInfo(0);
  }

  BookOrder bookOrder;

  Future<void> loadData(int id ) async {
    Map<String, dynamic> params = {
      "id" : id
    };
    try {
      emit(SearchLoading());
       bookOrder = await _searchRepository.fetchBookOrder(params);
      emit(ItemsSearchLoaded(bookOrder));
    } on NetworkException {
      emit(SearchError("Couldn't fetch data. Is the device online?"));
    }
    print(bookOrder.toJson());
  }

  Future<void> newBook(String idBook,String id,int time) async {
    Map<String, dynamic> params = {
      "bookOrder": {
        "idBookdetail" : idBook,
        "idStudent" : id,
        "time" : time
      }
    };
    try {
      emit(SearchLoading());
      if (await _searchRepository.createBookOrder(params)) {
        emit((ItemsSearchUploaded()));
      } else {
        emit(SearchError("Submit failed"));
      }
    } on NetworkException {
      emit(SearchError("Error submitting data"));
    }
    loadData(int.parse(id));
  }
  dynamic bookDetail;

  Future<void> getBookDetail(String id) async {
    try {
      emit(SearchLoading());
      final response = await SearchService.getBookDetail({"id": id});
      if (response.statusCode == 200) {
        bookDetail = response.data['result'];
        emit(ItemsBookDetailLoaded(bookDetail));
        emit(ItemsSearchLoaded(bookOrder));
      }
    } on NetworkException {
      emit(SearchError("Couldn't fetch data. Is the device online?"));
    }
    print(bookDetail.toString());
  }

  BookOrderInfo bookOrderInfo ;

  Future<void> getBookOrderInfo(int id) async {
    try {
      emit(SearchLoading());
      final response = await SearchService.getBookOrderInfo({"id": 16});
      print(response);
      if (response.statusCode == 200) {
        bookOrderInfo = BookOrderInfo.fromJson(response.data['result'] as Map<String,dynamic>);
        emit(ItemsBookOrderInfo(bookOrderInfo));
        emit(ItemsSearchLoaded(bookOrder));
      }
    } on NetworkException {
      emit(SearchError("Couldn't fetch data. Is the device online?"));
    }
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    print(change.nextState);
  }

}