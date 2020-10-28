import 'package:app_tv/model/library/list_book.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'list-book.state.dart';

class ListBookCubit extends Cubit<ListBookState> {
  final LibraryRepository _libraryRepository;
  ListBookCubit(this._libraryRepository) : super(ListBookInitial()) {
    loadData();
  }

  List<Book> listBook;

  Future<void> loadData() async {
    Map<String, dynamic> params = {};
    try {
      emit(ListBookLoading());
      ListBook _listBook = await _libraryRepository.fetchListBook(params);
      listBook = _listBook.result;
      print(listBook.length);
      emit(ItemsListBookLoaded(listBook));
    } on NetworkException {
      emit(ListBookError("Couldn't fetch data. Is the device online?"));
    }
  }

  Future<void> newBook(String name,int price,String id,int amount) async {
    Map<String, dynamic> params = {
      "book" : {
        "name" : name,
        "price" : price,
        "id" : id,
        "amount" : amount
      }
    };
    try {
      emit(ListBookLoading());
      if (await _libraryRepository.createBook(params)) {
        emit((ItemsListBookUploaded()));
      } else {
        emit(ListBookError("Submit failed"));
      }
    } on NetworkException {
      emit(ListBookError("Error submitting data"));
    }
    loadData();
  }

  @override
  void onChange(Change<ListBookState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}