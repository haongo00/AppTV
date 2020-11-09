import 'package:app_tv/app/home/library/member/member.cubit.dart';
import 'package:app_tv/model/member/list_member.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class MemberInfoView extends StatefulWidget {
  final Member member;
  final MemberCubit cubit;
  const MemberInfoView({this.member, this.cubit}) : super();

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
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                showDialog(context: context, builder: (_) => _edit());
              },
            )
          ],
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
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal * 20,
              backgroundImage: NetworkImage('${widget.member.avatar}'),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 50,
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
          SizedBox(height: SizeConfig.blockSizeVertical * 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Text("${widget.member.department.name}")
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.support_agent_sharp,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Text("${widget.member.GenCode}")
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Text("${widget.member.role?.name}")
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.fiber_manual_record_rounded,
                        size: 25,
                        color: Colors.grey,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                      Text((widget.member.gender) ? "Nam" : "Nữ")
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal * 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.today,
                    size: 25,
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal * 3),
                  Text('${widget.member.born}')
                ],
              )),
        ],
      ),
    );
  }
  int roleId;
  int departmentId;

  Widget _edit() {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilderDropdown(
              attribute: "vt",
              decoration: InputDecoration(labelText: "Vai trò"),
              validators: [FormBuilderValidators.required()],
              items: widget.cubit.roles.map((item) => DropdownMenuItem(value: item, child: Text("${item['name']}"))).toList(),
              onChanged: (value) {
                roleId = int.parse(value['id'].toString());
              },
            ),
            FormBuilderDropdown(
              attribute: "vt",
              decoration: InputDecoration(labelText: "Ban"),
              validators: [FormBuilderValidators.required()],
              items: widget.cubit.departments.map((item) => DropdownMenuItem(value: item, child: Text("${item['name']}"))).toList(),
              onChanged: (value) {
                departmentId = int.parse(value['id'].toString());
              },
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Modular.navigator.pop();
            },
            child: Text("Close",style: TextStyle(color: Colors.grey))),
        SizedBox(width: SizeConfig.blockSizeHorizontal * 30),
        FlatButton(
            onPressed: () {
              Modular.navigator.pop();
            },
            child: Text("Save", style: TextStyle(color: Colors.teal)))
      ],
    );
  }
}
