import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_tv/routers/application.dart';
import 'package:app_tv/services/authentication.service.dart';

class LoginCubit extends Cubit<bool> {
  /// {@macro cubit}
  LoginCubit() : super(true);

  String _userName = "", _password = "";
  String _message;

  void set userName(String _userName) => this._userName = _userName;

  void set password(String _password) => this._password = _password;

  String get message => _message;

  bool get hasAnyEmptyAttribute => _userName == "" || _password == "";

  Future<bool> login() async {
    emit(false);
//    Map<String, dynamic> params = {
//      "account" : {
//        "username" : "admin",
//        "password" : "123qwe"
//      }
//    };
    Map<String, dynamic> params = {
      "account" : {
        "username" : _userName,
        "password" : _password
      }
    };
    final response = await AuthenticationService.login(params);
    if (response.statusCode == 200) {
      var mapResponse = response.data;
      if(mapResponse["status"] == 200) {
        print(mapResponse['token']);
        Application.sharePreference
          ..putString('token', mapResponse['token'].toString());
      }
    }
    _message = (response.data['message']) != null ? "${response.data['message']}" : '';
    emit(true);
    return response.statusCode == 200;
  }
}
