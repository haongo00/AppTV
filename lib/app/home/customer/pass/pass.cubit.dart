import 'package:app_tv/repositories/infor/infor.repositories.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'pass.state.dart';

class PassCubit extends Cubit<PassState> {
  final InforRepositories _inforRepositories;
  PassCubit(this._inforRepositories) : super(PassInitial());

  Future<void> resetPass(String oldPass,String newPass) async {
    Map<String, dynamic> params = {
      'password' : oldPass,
      'newPassword' : newPass
    };
    try {
      emit(PassUploading());
      if (await _inforRepositories.resetPass(params)) {
        emit((ItemsPassUploaded()));
      } else {
        emit(PassError("Submit failed"));
      }
    } on NetworkException {
      emit(PassError("Error submitting data"));
    }
  }
}