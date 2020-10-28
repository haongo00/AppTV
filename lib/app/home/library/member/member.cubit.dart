import 'package:app_tv/model/member/list_member.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'member.state.dart';

class MemberCubit extends Cubit<MemberState> {
  final LibraryRepository _libraryRepository;
  MemberCubit(this._libraryRepository) : super(MemberInitial()) {
    loadData();
  }

  List<Member> member;

  Future<void> loadData() async {
    Map<String, dynamic> params = {};
    try {
      emit(MemberLoading());
      ListMember _member = await _libraryRepository.fetchListMember(params);
      member = _member.result;
      print(member.length);
      emit(ItemsMemberLoaded(member));
    } on NetworkException {
      emit(MemberError("Couldn't fetch data. Is the device online?"));
    }
  }

  @override
  void onChange(Change<MemberState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}