import 'package:app_tv/app/components/custom-appbar/static-appbar.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PassView extends StatefulWidget {
  @override
  _PassViewState createState() => _PassViewState();
}

class _PassViewState extends State<PassView> {
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
            ),
            FormBuilderTextField(
              attribute: "new",
              decoration: InputDecoration(labelText: "Mật khẩu mới : "),
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            FormBuilderTextField(
              attribute: "ag",
              decoration: InputDecoration(labelText: "Nhập lại mật khẩu : "),
              validators: [
                FormBuilderValidators.required(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    color: Color(0xff068189),
                    onPressed: () {},
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
