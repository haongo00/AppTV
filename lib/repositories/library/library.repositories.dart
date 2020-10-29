import 'package:app_tv/model/library/list_book.dart';
import 'package:app_tv/model/member/list_member.dart';
import 'package:app_tv/services/library/library.service.dart';
import 'package:app_tv/utils/exception.dart';

class LibraryRepository {
  Future<ListBook> fetchListBook(Map<String, dynamic> params) async {
    final response = await LibraryService.getListBook(params);
    return (response.statusCode == 200)
        ? ListBook.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException;
  }
  Future<ListMember> fetchListMember(Map<String, dynamic> params) async {
    final response = await LibraryService.getListMember(params);
    return (response.statusCode == 200)
        ? ListMember.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException;
  }
  Future<bool> createBook(Map<String, dynamic> params) async {
    final response = await LibraryService.createBook(params);
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }
  Future<Book> fetchBookInfo(Map<String, dynamic> params,int id) async {
    final response = await LibraryService.getBookInfo(params,id);
    return (response.statusCode == 200)
        ? Book.fromJson(response.data['result'] as Map<String, dynamic>)
        : throw NetworkException;
  }
}