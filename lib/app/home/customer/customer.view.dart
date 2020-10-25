import 'package:app_tv/app/app.module.dart';
import 'package:app_tv/app/components/custom-appbar/static-appbar.component.dart';
import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 20,
                    child: Column(
                      children: [
                        Expanded(
                            child: FlatButton(
                              onPressed: () { Modular.link.pushNamed(HomeModule.inforView); },
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 50,
                                height: SizeConfig.blockSizeVertical * 10,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text("Thông tin cá nhân", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                            )),
                        SizedBox(height: 5.0),
                        Expanded(
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              height: SizeConfig.blockSizeVertical * 10,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Text("Thêm thành viên", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
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
            ),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  Modular.to.pushNamedAndRemoveUntil(AppModule.login, ModalRoute.withName('/'));
                },
                child: Text("LogOut",style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}