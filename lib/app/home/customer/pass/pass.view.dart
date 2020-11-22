import 'package:app_tv/app/components/custom-appbar/static-appbar.component.dart';
import 'package:app_tv/app/home/customer/pass/pass.cubit.dart';
import 'package:app_tv/repositories/infor/infor.repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PassView extends StatefulWidget {
  @override
  _PassViewState createState() => _PassViewState();
}

class _PassViewState extends State<PassView> {

  PassCubit _cubit = PassCubit(InforRepositories());
  String agPass = '';
  String newPass = '';
  String oldPass = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: staticAppbar(title: "Đổi Mật Khẩu"),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            FormBuilderTextField(
              attribute: "old",
              decoration: InputDecoration(labelText: "Mật khẩu cũ : "),
              validators: [
                FormBuilderValidators.required(),
              ],
              onFieldSubmitted: (value) => oldPass = value.toString(),
            ),
            FormBuilderTextField(
              attribute: "new",
              decoration: InputDecoration(labelText: "Mật khẩu mới : "),
              validators: [
                FormBuilderValidators.required(),
              ],
              onFieldSubmitted: (value) => newPass = value.toString(),
            ),
            FormBuilderTextField(
              attribute: "ag",
              decoration: InputDecoration(labelText: "Nhập lại mật khẩu : "),
              validators: [
                FormBuilderValidators.required(),
              ],
              onFieldSubmitted: (value) => agPass = value.toString(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    color: Color(0xff068189),
                    onPressed: () async {
                      if (agPass != newPass) {
                        Fluttertoast.showToast(
                          msg: "Không giống nhau",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        await _cubit.resetPass(oldPass, newPass);
                        Modular.navigator.pop();
                      }
                    },
                    child: Text(
                      "Cập nhập",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
