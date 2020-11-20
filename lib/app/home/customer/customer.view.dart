import 'package:app_tv/app/app.module.dart';
import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/routers/application.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Colors.grey,
                    size: 100,
                  ),
                  Text("${Application.sharePreference.get("userRole")}")
                ],
              ),
              FlatButton(
                onPressed: () {
                  Modular.link.pushNamed(HomeModule.inforView);
                },
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 80,
                  height: SizeConfig.blockSizeVertical * 8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text("Thông tin cá nhân",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
          Column(
            children: [
              FlatButton(
                color: Colors.teal,
                  onPressed: () {
                    Modular.link.pushNamed(HomeModule.passView);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.vpn_key_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(width: 30),
                      Text("Đổi Mật Khẩu",
                          style: TextStyle(color: Colors.white)),
                    ],
                  )),
              SizedBox(height: 5.0),
              // Divider(
              //   height: 5.0,
              //   color: Colors.grey,
              //   thickness: 2.0,
              // ),
              FlatButton(
                  color: Colors.teal,
                  onPressed: () {
                    Modular.to.pushNamedAndRemoveUntil(AppModule.login, ModalRoute.withName('/'));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(width: 30),
                      Text("Đăng Xuất", style: TextStyle(color: Colors.white)),
                    ],
                  )),
              SizedBox(height: 5.0),
              // Divider(
              //   height: 5.0,
              //   color: Colors.grey,
              //   thickness: 2.0,
              // ),
            ],
          )
        ],
      ),
    );
  }
}
