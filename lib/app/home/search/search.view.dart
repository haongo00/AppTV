import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _textField(),
          _searchButton(),
          Divider(
            height: 5.0,
            color: Colors.grey,
            thickness: 2.0,
          ),
          _infor(),
        ],
      ),
    );
  }

  Widget _textField() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 6,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      width: SizeConfig.blockSizeHorizontal * 70,
      height: SizeConfig.blockSizeVertical * 6,
      child: FormBuilderTextField(
        maxLines: 1,
        attribute: 'msv',
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Nhập mã sinh viên",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide(color: Color(0xff068189)),
          ),
        ),
        keyboardType: TextInputType.number,
        validators: [FormBuilderValidators.required()],
        onChanged: (dynamic val) {},
      ),
    );
  }

  Widget _searchButton() {
    bool isLoaded = true;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical),
      child: ButtonTheme(
        minWidth: SizeConfig.safeBlockHorizontal * 35,
        height: 45.0,
        child: AbsorbPointer(
          absorbing: !isLoaded,
          child: FlatButton(
            color: Color(0xff068189),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            onPressed: () async {},
            child: isLoaded
                ? Text(
                    "Tra cứu",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  )
                : Theme(
                    data: ThemeData(
                      cupertinoOverrideTheme:
                          CupertinoThemeData(brightness: Brightness.dark),
                    ),
                    child: CupertinoActivityIndicator(),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _infor() {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.only(top: 8.0, right: 15.0, left: 15.0),
      color: Color(0xffF0EFEF),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profile(),
            _text('Thông tin'),
            Row(
              children: [
                _studentInfoRow('SN', '11/12/2000'),
                Spacer(),
                _studentInfoRow('Giới tính', 'Nam')
              ],
            ),
            _studentInfo('QH-2018-I/CQ-C-CLC'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text('Tình trạng mượn sách'),
                IconButton(
                    icon: Icon(Icons.add_circle),
                    color: Colors.teal,
                    onPressed: (){
                      Modular.link.pushNamed(HomeModule.borrowBook);
                    })
              ],
            ),
            _bookInfor(false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: _text('Lịch sử mượn sách'),
            ),
            _bookInfor(true)
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipOval(
              child: Image.network(
                'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-7.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Nguyen Van A',
            style: TextStyle(fontSize: 25),
          ),
          Text(
            '18020459',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _text(String _s) {
    return Text(
      _s,
      style: TextStyle(color: Colors.grey[700], fontSize: 18),
    );
  }

  Widget _studentInfoRow(String _title, String _infor) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 42,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '${_title} : ${_infor}',
        style: TextStyle(fontSize: 20),
      ),
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(15.0)),
    );
  }

  Widget _studentInfo(String _infor) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Lớp : ${_infor}',
        style: TextStyle(fontSize: 20),
      ),
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(15.0)),
    );
  }

  Widget _bookInfor(bool _val) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: FlatButton(
        color: Colors.grey[400],
        onPressed: () {
          Modular.link.pushNamed(HomeModule.giveBook);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 48,
                height: 48,
                margin: EdgeInsets.zero,
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 30),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0)),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Toán cao cấp 1',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                    Text(
                      '112-231',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngày mượn : 26/10/2000',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    _val
                        ? Text(
                            'Ngày trả : 26/10/2000',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          )
                        : SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
