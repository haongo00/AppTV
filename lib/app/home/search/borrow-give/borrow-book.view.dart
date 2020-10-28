import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BorrowBookView extends StatefulWidget {
  _BorrowBookView createState() => _BorrowBookView();
}

class _BorrowBookView extends State<BorrowBookView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff068189),
        title: Text("GHI MƯỢN"),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        children: [
          _textFiled('Mã sách'),
          _textFiled('Mã'),
          _textFiled('Tên sách'),
          _textFiled('Giá sách'),
          SizedBox(height: SizeConfig.blockSizeVertical * 10),
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
              Expanded(
                  child: FlatButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        Modular.navigator.pop();
                      },
                      child: Text(
                        "Hủy",
                        style: TextStyle(color: Colors.white),
                      ))),
              Spacer(),
              Expanded(
                  child: FlatButton(
                      color: Color(0xff068189),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        Modular.navigator.pop();
                      },
                      child: Text(
                        "Ghi mượn",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
            ],
          )
        ],
      ),
    );
  }

  Widget _textFiled(String _tile) {
    return FormBuilderTextField(
      attribute: 'sach',
      decoration: InputDecoration(labelText: "${_tile} : "),
      validators: [
        FormBuilderValidators.required(),
      ],
    );
  }
}
