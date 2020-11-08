
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PassView extends StatefulWidget {
  @override
  _PassViewState createState() => _PassViewState();
}

class _PassViewState extends State<PassView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xff068189),
          title: Text("Đổi mật khẩu"),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: 0.5,
            child: Image.network(
              "https://scontent.fhan2-3.fna.fbcdn.net/v/t31.0-8/11062339_936357076423736_8686865242051210984_o.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=KfvB_wquuYoAX_Yu869&_nc_ht=scontent.fhan2-3.fna&oh=906780f218fbf138114378e2ed1b9994&oe=5FBA62D8",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                FormBuilderTextField(
                  decoration: InputDecoration(labelText: "Mật khẩu cũ : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderTextField(
                  decoration: InputDecoration(labelText: "Mật khẩu mới : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                FormBuilderTextField(
                  decoration: InputDecoration(labelText: "Nhập lại mật khẩu : "),
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                        child: FlatButton(
                            color: Color(0xff068189),
                            onPressed: () {

                            },
                            child: Text("Cập nhập", style: TextStyle(color: Colors.white),

                            ))),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
