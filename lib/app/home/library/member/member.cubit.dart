import 'package:app_tv/model/member/list_member.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/services/library/library.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'member.state.dart';

class MemberCubit extends Cubit<MemberState> {
  final LibraryRepository _libraryRepository;

  MemberCubit(this._libraryRepository) : super(MemberInitial()) {
    loadData();
  }

  List<Member> member;
  List<dynamic> roles;
  List<dynamic> departments;

  Future<void> loadData() async {
    Map<String, dynamic> params = {"skip": 0, "take": 10};
    try {
      emit(MemberLoading());
      ListMember _member = await _libraryRepository.fetchListMember(params);
      member = _member.result;
      emit(ItemsMemberLoaded(member));
    } on NetworkException {
      emit(MemberError("Couldn't fetch data. Is the device online?"));
    }
    getRole();
  }

  Future<void> getRole() async {
    try {
      emit(RoleLoading());
      final response = await LibraryService.getRole({});
      if (response.statusCode == 200) {
        roles = response.data['result'] as List;
        emit(ItemsRoleLoaded(roles));
      }
    } on NetworkException {
      emit(MemberError("Couldn't fetch data. Is the device online?"));
    }
    getDepartment();
  }

  Future<void> getDepartment() async {
    try {
      emit(DepartmentLoading());
      final response = await LibraryService.getDepartment({});
      if (response.statusCode == 200) {
        departments = response.data['result'] as List;
        emit(ItemsDepartmentLoaded(departments));
      }
    } on NetworkException {
      emit(MemberError("Couldn't fetch data. Is the device online?"));
    }
  }

  Future<void> newUser(
      String name, String date, bool gender, String gen, String user, String pass, int roleId, int departmentId) async {
    Map<String, dynamic> params = {
      "name": name,
      "born": date,
      "username": user,
      "password": pass,
      "roleId": roleId,
      "departmentId": departmentId,
      "avatar": null
    };
    try {
      emit(MemberLoading());
      if (await _libraryRepository.createUser(params)) {
        emit(ItemsMemberUploaded());
      } else {
        emit(MemberError("Submit failed"));
      }
    } on NetworkException {
      emit(MemberError("Error submitting data"));
    }
    loadData();
  }

  Future<void> updateUser(
      {String name,
      String date,
      bool gender,
      String gen,
      String user,
      String pass,
      int roleId,
      int departmentId}) async {
    Map<String, dynamic> params = {
      "id" : 13,
      "name": name,
      "roleId": roleId,
      "departmentId": departmentId,
    };
    print(params);
    try {
      emit(MemberLoading());
      final response = await LibraryService.updateUser(params);
      print(response);
      if (response.statusCode == 200) {
        emit(ItemsMemberUploaded());
        Fluttertoast.showToast(
          msg: "Thành công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        emit(MemberError("Submit failed"));
        Fluttertoast.showToast(
          msg: "Không thành công",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } on NetworkException {
      emit(MemberError("Error submitting data"));
    }
    loadData();
  }

  @override
  void onChange(Change<MemberState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}
