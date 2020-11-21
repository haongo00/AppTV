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
                    height: SizeConfig.blockSizeVertical * 20,
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ], borderRadius: BorderRadius.circular(15.0), color: Color(0xFFF1F1F1)),
                    child: thongKe(),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 20,
                    child: Column(
                      children: [
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Modular.link.pushNamed(HomeModule.inputView);
                            },
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              height: SizeConfig.blockSizeVertical * 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFFF1F1F1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: SizeConfig.blockSizeVertical*1),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 25),
                                      child: Image.asset(
                                        'assets/library/nhaplieu.png',
                                        height: SizeConfig.blockSizeVertical * 4,
                                      )),
                                  Expanded(
                                    child: Text("Nhập liệu",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Modular.link.pushNamed(HomeModule.member);
                            },
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              height: SizeConfig.blockSizeVertical * 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  )
                                ],
                                color: Color(0xFFF1F1F1)
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: SizeConfig.blockSizeVertical*1),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Image.asset(
                                        'assets/library/thanhvien.png',
                                        height: SizeConfig.blockSizeVertical * 5,
                                      )),
                                  Expanded(
                                    child: Text("Thành viên",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
            ),
            // _getHistory()
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
        Row(
          children: [
            Expanded(
              child: Container(
                  child: Image.asset('assets/library/thongke.png', height: SizeConfig.blockSizeVertical * 10)),
            ),
            Text("Thống Kê", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 5.0),
          ],
        ),
        Text("Tuần này  ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Mượn : 50", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Trả : 20", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _getHistory() {
    return Column(
      children: [
        ...List.generate(5, (index) {
          return Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: (index % 2 == 0) ? Colors.white.withOpacity(0.8) : Color(0xff068189).withOpacity(0.8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sinh vien  18020916 da muon sach 1581212',
                        style: TextStyle(color: (index % 2 == 0) ? Colors.black : Colors.white)),
                    Text('12 : 20 PM  -  30/10/2020',
                        style: TextStyle(color: (index % 2 == 0) ? Colors.black : Colors.white)),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          );
        })
      ],
    );
  }
}
