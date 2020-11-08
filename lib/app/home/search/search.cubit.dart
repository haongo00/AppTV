import 'package:app_tv/model/book_order/book_order.dart';
import 'package:app_tv/repositories/search/search.repository.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'search.state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit(this._searchRepository) : super(SearchInitial()) {
    loadData();
  }

  BookOrder bookOrder;

  Future<void> loadData() async {
    Map<String, dynamic> params = {
      "id" : 16020002
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

}