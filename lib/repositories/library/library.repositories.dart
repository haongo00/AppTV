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
}