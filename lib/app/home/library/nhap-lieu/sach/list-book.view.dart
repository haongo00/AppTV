import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/app/home/library/nhap-lieu/sach/list-book.cubit.dart';
import 'package:app_tv/repositories/library/library.repositories.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListBookView extends StatefulWidget {
  @override
  _ListBookViewState createState() => _ListBookViewState();
}

class _ListBookViewState extends State<ListBookView> with AutomaticKeepAliveClientMixin {
  ListBookCubit _cubit = ListBookCubit(LibraryRepository());

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff068189),
        foregroundColor: Colors.black,
        onPressed: () {
          Modular.link.pushNamed(HomeModule.newBook, arguments: _cubit);
          // Respond to button press
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Stack(
        children: [
          // Center(
          //   child: Opacity(
          //     opacity: 0.5,
          //     child: Image.network(
          //       "https://scontent.fhan2-3.fna.fbcdn.net/v/t31.0-8/11062339_936357076423736_8686865242051210984_o.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=KfvB_wquuYoAX_Yu869&_nc_ht=scontent.fhan2-3.fna&oh=906780f218fbf138114378e2ed1b9994&oe=5FBA62D8",
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          BlocBuilder<ListBookCubit, ListBookState>(
              cubit: _cubit,
              buildWhen: (prev, now) => now is ListBookLoading || now is ItemsListBookLoaded,
              builder: (context, state) {
                if (state is ItemsListBookLoaded) {
                  return _getBody(state);
                } else if (state is ListBookError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: CupertinoActivityIndicator(radius: 15));
                }
              }),
        ],
      ),
    );
  }

  Widget _getBody(ListBookState state) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical * 1),
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 5.0),
          width: SizeConfig.blockSizeHorizontal * 80,
          height: SizeConfig.blockSizeVertical * 5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: FormBuilderTextField(
            attribute: "search",
            decoration: InputDecoration(hintText: "Search", border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                width: 130,
                height: 3,
              ),
            ),
            Text("Tổng số : ${_cubit.listBook.length}",
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Expanded(
              child: Container(
                color: Colors.green,
                width: 135,
                height: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(_cubit.listBook.length, (index) {
                    return Card(
                      elevation: 5.0,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(15.0),
                      // ),
                      margin: EdgeInsets.only(top: 8.0, right: 15.0, left: 15.0),
                      color: (index % 2 == 0) ? Colors.white.withOpacity(0.8) : Color(0xff068189).withOpacity(0.8),
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15.0),
                        // ),
                        onPressed: () {
                          Modular.link
                              .pushNamed(HomeModule.bookInfo, arguments: _cubit.listBook.elementAt(index))
                              .then((value) {
                            _cubit.loadData();
                          });
                        },
                        onLongPress: () => _showAlert(context, index),
                        child: Container(
                          height: SizeConfig.blockSizeVertical * 10,
                          margin: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: SizeConfig.blockSizeHorizontal * 3,
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/2c/fc/93/2cfc93d7665f5d7728782700e50596e3.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${_cubit.listBook[index].idBook}",
                                      style: TextStyle(
                                          color: (index % 2 == 0) ? Colors.black : Colors.white, fontSize: 16)),
                                  SizedBox(height: 10.0),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 65,
                                    child: Text(
                                        "${_cubit.listBook[index].name} - ${_cubit.listBook[index].idBook}",
                                        style: TextStyle(
                                            color: (index % 2 == 0) ? Colors.black : Colors.white, fontSize: 13),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text("${_cubit.listBook[index].price}",
                                      style: TextStyle(
                                          color: (index % 2 == 0) ? Colors.black : Colors.white, fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAlert(BuildContext context, int index) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          message: Text(
            "Do you want to Delete ?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                "Delete",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              isDestructiveAction: true,
              onPressed: () {
                _cubit.deleteBook(_cubit.listBook[index].idBook);
                Navigator.pop(context);
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
