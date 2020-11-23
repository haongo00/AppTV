import 'package:app_tv/app/components/custom-appbar/static-appbar.component.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';


class ResetInfoView extends StatefulWidget {
  @override
  _ResetInfoViewState createState() => _ResetInfoViewState();
}

class _ResetInfoViewState extends State<ResetInfoView> {

  String name ="";
  String date = "";
  bool gender = true;
  String email = "";
  String sdt = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: staticAppbar(title: "Chỉnh sửa thông tin"),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          FormBuilderTextField(
            attribute: 'sac',
            decoration: InputDecoration(labelText: "Họ tên : "),
            validators: [
              FormBuilderValidators.required(),
            ],
            onChanged: (value) {
              name = value.toString();
            },
          ),
          FormBuilderDateTimePicker(
            attribute: 'expiry_date',
            inputType: InputType.date,
            initialDate: DateTime.now(),
            decoration: InputDecoration(labelText: "Ngày sinh", suffixIcon: Icon(Icons.calendar_today)),
            format: DateFormat("dd-MM-yyyy"),
            onChanged: (value) {
              date = value.toString();
            },
          ),
          FormBuilderDropdown(
            attribute: "gender",
            decoration: InputDecoration(labelText: "Giới Tính"),
            validators: [FormBuilderValidators.required()],
            items: ['Nam', 'nữ'].map((item) => DropdownMenuItem(value: item, child: Text("$item"))).toList(),
            onChanged: (value) {
              if (value.toString() == "Nam") {
                gender = true;
              } else {
                gender = false;
              }
            },
          ),
          FormBuilderTextField(
            attribute: 'email',
            decoration: InputDecoration(labelText: "Email : "),
            validators: [
              FormBuilderValidators.required(),
            ],
            onChanged: (value) {
              email = value.toString();
            },
          ),
          FormBuilderTextField(
            attribute: 'sdt',
            decoration: InputDecoration(labelText: "SĐT : "),
            validators: [
              FormBuilderValidators.required(),
            ],
            onChanged: (value) {
              sdt = value.toString();
            },
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 10),
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
              Expanded(
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        Modular.navigator.pop();
                      },
                      child: Text(
                        "Hủy",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
              Expanded(
                  child: FlatButton(
                      color: Color(0xff068189),
                      onPressed: () {
                        Modular.navigator.pop();
                      },
                      child: Text(
                        "Lưu",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
            ],
          )
        ],
      )
    );
  }
}
