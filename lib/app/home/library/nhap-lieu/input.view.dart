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
            toolbarHeight: SizeConfig.blockSizeVertical * 10,
            backgroundColor: Colors.teal,
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              indicatorWeight: 2.0,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal*50,
                    alignment: Alignment.center,
                    child: Text("Sách", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                ),
                Tab(
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal*50,
                    alignment: Alignment.center,
                    child: Text("Mượn / Trả", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
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
