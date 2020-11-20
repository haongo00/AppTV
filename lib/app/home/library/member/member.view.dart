import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/app/home/library/member/member-info/member-info.view.dart';
import 'package:app_tv/app/home/library/member/member.cubit.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MemberView extends StatefulWidget {
  @override
  _MemberViewState createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  MemberCubit cubit = MemberCubit(LibraryRepository());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color(0xff068189),
          ),
          title: Container(
              width: SizeConfig.blockSizeHorizontal * 40,
              height: SizeConfig.blockSizeVertical * 5,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xff068189)),
              child: Text("Thành Viên")),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff068189),
          foregroundColor: Colors.black,
          onPressed: () {
            Modular.link.pushNamed(HomeModule.newMember, arguments: cubit);
            // Respond to button press
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: BlocBuilder<MemberCubit, MemberState>(
            cubit: cubit,
            buildWhen: (prev, now) => now is MemberLoading || now is ItemsMemberLoaded,
            builder: (context, state) {
              if (state is ItemsMemberLoaded) {
                return _getBody(state);
              } else if (state is MemberError) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: CupertinoActivityIndicator(radius: 15));
              }
            }),
      ),
    );
  }

  Widget _getBody(MemberState state) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical * 1),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 5.0),
          width: SizeConfig.blockSizeHorizontal * 80,
          height: SizeConfig.blockSizeVertical * 5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: FormBuilderTextField(
            attribute: "search",
            decoration: InputDecoration(hintText: "Search", border: InputBorder.none),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical * 3),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.teal,
                width: 130,
                height: 3,
              ),
            ),
            Text("Tổng số : ${cubit.member.length}",
                style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
            Expanded(
              child: Container(
                color: Colors.green,
                width: 135,
                height: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.blockSizeVertical * 3),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ...List.generate(cubit.member.length, (index) {
                    return Card(
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: Color(0xff068189).withOpacity(0.75),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 95,
                          margin: EdgeInsets.only(left:5, top: 20, right: 20, bottom: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  radius: SizeConfig.blockSizeHorizontal * 8,
                                  backgroundImage: NetworkImage(
                                      'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-7.jpg'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${cubit.member.elementAt(index).name}',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      '${cubit.member.elementAt(index).department.name} --- ${cubit.member.elementAt(index).GenCode}',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          // Modular.link.pushNamed(HomeModule.memberInfo,arguments: cubit.member.elementAt(index));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MemberInfoView(member: cubit.member.elementAt(index), cubit: cubit)),
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
