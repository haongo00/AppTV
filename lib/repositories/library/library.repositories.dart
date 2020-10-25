import 'package:app_tv/model/library/list_book.dart';
import 'package:app_tv/services/library/library.service.dart';
import 'package:app_tv/utils/exception.dart';

class LibraryRepository {
  Future<ListBook> fetchApproved(Map<String, dynamic> params) async {
    final response = await LibraryService.getListBook(params);
    return (response.statusCode == 200)
        ? ListBook.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException;
  }
}