import 'package:app_tv/app/home/library/nhap-lieu/sach/list-book.view.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/material.dart';

class InputView extends StatefulWidget {
  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.teal,
            ),
            elevation: 0,
            toolbarHeight: SizeConfig.blockSizeVertical * 10,
            backgroundColor: Colors.white,
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff068189)),
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              indicatorWeight: 2.0,
              tabs: [
                Tab(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color:Color(0xff068189), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Sách"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color:Color(0xff068189), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Mượn / Trả"),
                    ),
                  ),
                ),
              ],
            ),
            bottomOpacity: 1,
          ),
          body: TabBarView(
            children: [
              ListBookView(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
