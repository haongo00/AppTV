import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MemberView extends StatefulWidget {
  @override
  _MemberViewState createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xff068189),
        ),
        title: Container(
            width: SizeConfig.blockSizeHorizontal * 30,
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
          Modular.link.pushNamed(HomeModule.newMember);
          // Respond to button press
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Center(child: _getBody()),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                width: 130,
                height: 3,
              ),
            ),
            Text("Tổng số : 5",
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
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(20, (index) {
                    return Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: (index % 2 == 0) ? Colors.white.withOpacity(0.8) : Color(0xff068189).withOpacity(0.8),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal*95,
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phan Van Minh - Gen : 3',style: TextStyle(color:(index % 2 == 0) ? Colors.black : Colors.white)),
                              Text('MSSV : 18020916',style: TextStyle(color:(index % 2 == 0) ? Colors.black : Colors.white)),
                            ],
                          ),
                        ),
                        onPressed: () {

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
