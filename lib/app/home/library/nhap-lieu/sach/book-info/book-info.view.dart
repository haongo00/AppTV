import 'package:app_tv/model/library/list_book.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookInfoView extends StatefulWidget {
  final Book book ;

  const BookInfoView({this.book}) : super();
  @override
  _BookInfoViewState createState() => _BookInfoViewState();
}

class _BookInfoViewState extends State<BookInfoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff068189),
          title: Text("Edit Book"),
        ),
        body: _getBody(),
      ),
    );
  }
  Widget _getBody() {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            FormBuilderTextField(
              attribute: 'sach',
              decoration: InputDecoration(labelText: "Mã Sách : "),
              initialValue: "${widget.book.idBook}",
              validators: [
                FormBuilderValidators.required(),
              ],
              onChanged: (value) {
              },
            ),
            FormBuilderTextField(
              attribute: 'sach',
              decoration: InputDecoration(labelText: "Tên Sách : "),
              initialValue: "${widget.book.name}",
              validators: [
                FormBuilderValidators.required(),
              ],
              onChanged: (value) {
              },
            ),
            FormBuilderTextField(
              attribute: 'sach',
              decoration: InputDecoration(labelText: "Giá Sách : "),
              initialValue: "${widget.book.price}",
              validators: [
                FormBuilderValidators.required(),
              ],
              onChanged: (value) {
              },
            ),
            FormBuilderTextField(
              attribute: 'sach',
              decoration: InputDecoration(labelText: "Số lượng : "),
              initialValue: "${widget.book.amount}",
              validators: [
                FormBuilderValidators.required(),
              ],
              onChanged: (value) {
              },
            ),

            SizedBox(height: SizeConfig.blockSizeVertical*10),
            Row(
              children: [
                SizedBox(width: SizeConfig.blockSizeHorizontal*15),
                Expanded(child: FlatButton( color : Colors.red,onPressed: () {
                  Modular.navigator.pop();
                }, child: Text("Hủy",style: TextStyle(color: Colors.white),))),
                SizedBox(width: SizeConfig.blockSizeHorizontal*15),
                Expanded(child: FlatButton( color : Color(0xff068189),onPressed: () {
                  Modular.navigator.pop();
                }, child: Text("Lưu",style: TextStyle(color: Colors.white),))),
                SizedBox(width: SizeConfig.blockSizeHorizontal*15),
              ],

            )
          ],
        ),
      ),
    );
  }
}
