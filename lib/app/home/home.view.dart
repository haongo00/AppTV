import 'package:app_tv/app/home/customer/customer.view.dart';
import 'package:app_tv/app/home/home-page/home-page.view.dart';
import 'package:app_tv/app/home/library/library.view.dart';
import 'package:app_tv/app/home/notification/notification.view.dart';
import 'package:app_tv/app/home/search/borrow-give/give-book.view.dart';
import 'package:app_tv/app/home/search/search.view.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical*10,
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              indicatorWeight: 3.0,
              unselectedLabelColor: Colors.grey,
              labelColor: Color(0xff068189),
              indicatorColor: Color(0xff068189),
              tabs: [
                Tab(
                    icon: SizedBox(
                      width: SizeConfig.blockSizeHorizontal*20,
                      height: SizeConfig.blockSizeVertical*10,
                      child: Icon(
                        Icons.house,
                        size: 30,
                      ),
                    )
                ),
                Tab(
                    icon: SizedBox(
                      width: SizeConfig.blockSizeHorizontal*20,
                      height: SizeConfig.blockSizeVertical*10,
                      child: Icon(
                        Icons.library_books,
                        size: 30,
                      ),
                    )
                ),
                Tab(
                    icon: SizedBox(
                      width: SizeConfig.blockSizeHorizontal*20,
                      height: SizeConfig.blockSizeVertical*10,
                      child: Icon(
                        Icons.notifications_none_outlined,
                        size: 30,
                      ),
                    )
                ),
                Tab(
                    icon: SizedBox(
                      width: SizeConfig.blockSizeHorizontal*20,
                      height: SizeConfig.blockSizeVertical*10,
                      child: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    )
                ),
                Tab(
                    icon: SizedBox(
                      width: SizeConfig.blockSizeHorizontal*20,
                      height: SizeConfig.blockSizeVertical*10,
                      child: Icon(
                        Icons.list,
                        size: 30,
                      ),
                    )
                ),

              ],
            ),
            bottomOpacity: 1,
          ),
          body: TabBarView(
            children: [
              HomePage(),
              Library(),
              NotificationApp(),
              Search(),
//            GiveBookView(),
              Customer(),
            ],
          ),
        ),
      ),
    );
  }
}
