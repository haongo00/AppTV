import 'package:app_tv/model/member/list_member.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';


class MemberInfoView extends StatefulWidget {
  final Member member;

  const MemberInfoView({this.member}) : super();
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
          SizedBox(height: 20.0,),
          Center(
            child: CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal*20,
              backgroundImage:
              NetworkImage('${widget.member.avatar}'),
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
                  initialValue: "${widget.member.name}",
                  textAlign: TextAlign.center,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
              ),
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
                  Text("${widget.member.department.name}")
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
                  Text("${widget.member.role.Code}")
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
                  Text("${widget.member.GenCode}")
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
                  Text((widget.member.gender) ? "Nam" : "Nữ")
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
              initialValue: (widget.member.born == null) ? null : DateTime.parse("${widget.member.born}"),
              decoration: InputDecoration(labelText: "",icon: Icon(Icons.calendar_today)),
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
