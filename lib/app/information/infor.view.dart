
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InforView extends StatefulWidget {
  @override
  _InforViewState createState() => _InforViewState();
}



class _InforViewState extends State<InforView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text("Thông tin thành viên"),
      ),
      //
      body: _getBody(),
    );
  }
  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical*6),
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
              Icon(
                Icons.people,
                size: 20,
                color: Colors.grey,
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal*3),
              Text("Nguyễn Văn A", style: TextStyle(fontSize: 23.0),)
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
                  Text("Ban TCSK",style: TextStyle(fontSize: 20.0),)
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
                  Text("Thành viên",style: TextStyle(fontSize: 20.0),)
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
                  Text("Gen 3 ",style: TextStyle(fontSize: 20.0),)
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
                  Text("Nam",style: TextStyle(fontSize: 20.0),)
                ],
              )
            ],
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal*60,

          ),

        ],
      ),
    );
  }
}