import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff068189),
        title: Text("Bài viết"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 35,
            margin: EdgeInsets.all(10.0),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 5.5,
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
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Bạn đang nghĩ gi",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
              Expanded(
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        // Modular.link.pushNamed(HomeModule.HomePage);
                      },
                      child: Text(
                        "Hủy",
                        style: TextStyle(color: Colors.black),
                      ))),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
              Expanded(
                  child: FlatButton(
                      color: Colors.green,
                      onPressed: () {

                      },
                      child: Text(
                        "Lưu",
                        style: TextStyle(color: Colors.black),
                      ))),
              SizedBox(width: SizeConfig.blockSizeHorizontal * 15),
            ],
          )
        ],
      ),
    );
  }


}
