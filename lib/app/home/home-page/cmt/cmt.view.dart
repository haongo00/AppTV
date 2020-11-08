import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CmtView extends StatefulWidget {
  @override
  _CmtViewState createState() => _CmtViewState();
}

class _CmtViewState extends State<CmtView> {
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
              height: SizeConfig.blockSizeHorizontal *72,
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
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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
                  border: Border.all(color: Colors.grey, width: 1.5))
          ),
          Container(
            width: double.infinity,
            height: SizeConfig.blockSizeHorizontal *20,
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
                                    'https://i.vietgiaitri.com/2018/2/16/trong-nam-moi-2018-day-se-la-nhung-bau-vat-tiem-an-co-the-soan-n-601339.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bùi Thị B',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'App thư viện hay quá',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(color: Colors.grey, width: 1.5))
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal*70,
            height: SizeConfig.blockSizeHorizontal *20,
            margin: EdgeInsets.only(right: 100),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 5.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Bạn đang nghĩ gi",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
