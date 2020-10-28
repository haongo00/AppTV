import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';


class MemberInfoView extends StatefulWidget {
  @override
  _MemberInfoViewState createState() => _MemberInfoViewState();
}

class _MemberInfoViewState extends State<MemberInfoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff068189),
          title: Text("Thông Tin Thành Viên"),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal*25,
              backgroundImage:
              NetworkImage('https://kenh14cdn.com/thumb_w/660/2019/8/8/photo-1-156524637935855688464.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: SizeConfig.blockSizeHorizontal*50,
                child: FormBuilderTextField(
                  attribute: 'sach',
                  decoration: InputDecoration(hintText: "Ahn Hani"),
                  textAlign: TextAlign.center,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
              ),
              Icon(
                Icons.edit,
                size: 20,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*3),
                  Text("Ban TCSK")
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*3),
                  Text("Thành viên")
                ],
              )
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.support_agent_sharp,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*3),
                  Text("Gen 3 ")
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.fiber_manual_record_rounded,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*3),
                  Text("Nam")
                ],
              )
            ],
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal*60,
            child: FormBuilderDateTimePicker(
              attribute: 'expiry_date',
              inputType: InputType.date,
              initialDate: DateTime.now(),
              decoration: InputDecoration(labelText: "Ngày sinh", suffixIcon: Icon(Icons.calendar_today)),
              format: DateFormat("dd-MM-yyyy"),
              onChanged: (value) {
              },
            ),
          ),

        ],
      ),
    );
  }
}
