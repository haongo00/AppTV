import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _create(),
          _post(),
        ],
      ),
    );
  }

  //
  Widget _create() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(color: Colors.grey, width: 1.5)),
      width: double.infinity,
      height: SizeConfig.blockSizeVertical * 7,
      margin: EdgeInsets.all(10.0),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 5.5,
        child: Container(
            padding: EdgeInsets.only(left: 5.0 , right: 5.0 ,top: 5.0 , bottom: 5.0),
            child: FlatButton(
              onPressed: () {
                  Modular.link.pushNamed(HomeModule.postView);
                },
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 40,
                height: SizeConfig.blockSizeVertical * 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text("Tạo bài viết mới", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            )
        ),
      ),
    );
  }

  Widget _post() {
    return Container(
        width: double.infinity,
        height: SizeConfig.blockSizeVertical * 55,
        margin: EdgeInsets.all(10.0),
        child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 5.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          child: ClipOval(
                            child: Image.network(
                              'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-7.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nguyen Van A',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '28/10/2020',
                              style:
                              TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                  ),
                  Container(
                      child: FlatButton(
                        onPressed: (){
                           Modular.link.pushNamed(HomeModule.cmtView);
                        },
                        child: Text(
                          'Status ....',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: SizeConfig.blockSizeVertical * 30,
                    width: double.infinity,
                    child: Image.network(
                      'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-7.jpg',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: Colors.grey, width: 1.5)));
  }
}
