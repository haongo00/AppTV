import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';


class NewMemberView extends StatefulWidget {
  @override
  _NewMemberViewState createState() => _NewMemberViewState();
}

class _NewMemberViewState extends State<NewMemberView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff068189),
          title: Text("Thêm Thành Viên"),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: 0.5,
            child: Image.network(
              "https://scontent.fhan2-3.fna.fbcdn.net/v/t31.0-8/11062339_936357076423736_8686865242051210984_o.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=KfvB_wquuYoAX_Yu869&_nc_ht=scontent.fhan2-3.fna&oh=906780f218fbf138114378e2ed1b9994&oe=5FBA62D8",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                FormBuilderTextField(
                  attribute: 'sach',
                  decoration: InputDecoration(labelText: "Họ tên : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderDateTimePicker(
                  attribute: 'expiry_date',
                  inputType: InputType.date,
                  initialDate: DateTime.now(),
                  decoration: InputDecoration(labelText: "Ngày sinh", suffixIcon: Icon(Icons.calendar_today)),
                  format: DateFormat("dd-MM-yyyy"),
                  onChanged: (value) {
                  },
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormBuilderCheckbox(
                //         attribute: 'tfs',
                //         leadingInput: false,
                //         label: Text("Nam"),
                //         onChanged: (value) {
                //
                //         },
                //       ),
                //     ),
                //     SizedBox(width: SizeConfig.blockSizeHorizontal*5),
                //     Expanded(
                //       child: FormBuilderCheckbox(
                //         attribute: 'tfs',
                //         leadingInput: false,
                //         label: Text("Nữ"),
                //         onChanged: (value) {
                //
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                FormBuilderDropdown(
                  attribute: "bank",
                  decoration: InputDecoration(labelText: "Giới Tính"),
                  validators: [FormBuilderValidators.required()],
                  items: ['Nam', 'nữ'].map((item) => DropdownMenuItem(value: item, child: Text("$item"))).toList(),
                  onChanged: (value) {},
                ),
                FormBuilderTextField(
                  attribute: 'sach',
                  decoration: InputDecoration(labelText: "Gen : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderTextField(
                  attribute: 'sach',
                  decoration: InputDecoration(labelText: "User name : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderTextField(
                  attribute: 'sach',
                  decoration: InputDecoration(labelText: "Mật khẩu : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderDropdown(
                  attribute: "bank",
                  decoration: InputDecoration(labelText: "Vai trò"),
                  validators: [FormBuilderValidators.required()],
                  items: ['Nhập liệu', 'Thu sách'].map((item) => DropdownMenuItem(value: item, child: Text("$item"))).toList(),
                  onChanged: (value) {},
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
            ),
          ),
        ),
      ],
    );
  }
}
