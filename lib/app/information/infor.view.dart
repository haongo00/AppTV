
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Container(
            height: SizeConfig.screenHeight,
            alignment: Alignment.center,
            child: Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/hinhnen.png',
                    height: SizeConfig.safeBlockVertical * 25,
                  ),
                  Container(
                    child: Text("Nguyễn Văn A", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )),
        
        )
    );
  }
}