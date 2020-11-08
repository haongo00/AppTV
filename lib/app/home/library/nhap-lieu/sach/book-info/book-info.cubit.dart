import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'book-info.state.dart';

class BookInfoCubit extends Cubit<BookInfoState> {
  final LibraryRepository _libraryRepository ;
  BookInfoCubit(this._libraryRepository) : super(BookInfoInitial());

  bool edit = false ;

  void changeEdit() {
    emit(ChangeEdit(edit = !edit));
  }

  Future<void> editBook(String name,int price,String id,int amount) async {
    Map<String, dynamic> params = {
      "book" : {
        "name" : name,
        "price" : price,
        "idBook" : id,
        "amount" : amount
      }
    };
    print(params);
    try {
      emit(ItemsBookInfoUploading());
      if (await _libraryRepository.editBookInfo(params)) {
        emit((ItemsBookInfoUploaded()));
      } else {
        emit(BookInfoError("Submit failed"));
      }
    } on NetworkException {
      emit(BookInfoError("Error submitting data"));
    }
  }
}