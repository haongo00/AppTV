import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 15,
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: thongKe(),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 15,
                    child: Column(
                      children: [
                        Expanded(
                            child: FlatButton(
                          onPressed: () { Modular.link.pushNamed(HomeModule.inputView); },
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 50,
                            height: SizeConfig.blockSizeVertical * 5,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Text("Nhập liệu", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        )),
                        SizedBox(height: 5.0),
                        Expanded(
                            child: Container(
                          width: SizeConfig.blockSizeHorizontal * 50,
                          height: SizeConfig.blockSizeVertical * 5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Text("Thành viên", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 5.0,
              color: Colors.grey,
              thickness: 2.0,
            )
          ],
        ),
      ),
    );
  }

  Widget thongKe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Thống Kê", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Tuần này : ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text("Mượn : ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text("Trả : ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
