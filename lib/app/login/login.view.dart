import 'package:app_tv/app/app.module.dart';
import 'package:app_tv/app/components/text-field/text-field.component.dart';
import 'package:app_tv/app/login/login.cubit.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  LoginCubit _cubit = LoginCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          resizeToAvoidBottomPadding: true,
          body: SingleChildScrollView(
            child: Container(
                height: SizeConfig.screenHeight,
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Image.asset(
                        'assets/logo_tv.png',
                        height: SizeConfig.safeBlockVertical * 25,
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 4),
                      buildLoginWidget(),
                      Expanded(
                        flex: 4,
                        child: SizedBox(),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Container buildLoginWidget() {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 75,
      child: FormBuilder(
        key: _fbKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFieldView(
              attribute: "user_name",
              title: "Tên đăng nhập",
              validators: [
                FormBuilderValidators.pattern(
                    r'^(?=.{0,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$'),
              ],
              onSaved: (String val) {
                _cubit.userName = val;
              },
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            TextFieldView(
              attribute: 'password',
              title: 'Mật khẩu',
              validators: [
                FormBuilderValidators.pattern(
                    r'^(?=.{0,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$'),
              ],
              onSaved: (String val) {
                _cubit.password = val;
              },
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 5),
            ButtonTheme(
              minWidth: SizeConfig.safeBlockHorizontal * 35,
              height: 45.0,
              child: BlocBuilder<LoginCubit, bool>(
                cubit: _cubit,
                builder: (context, isLoaded) {
                  return AbsorbPointer(
                    absorbing: !isLoaded,
                    child: FlatButton(
                      color: Color(0xff068189),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      onPressed: () async {
                        (_fbKey.currentState.saveAndValidate() &&
                                !_cubit.hasAnyEmptyAttribute)
                            ? (await _cubit.login())
                                ? Modular.to
                                    .pushReplacementNamed(AppModule.home)
                                : Fluttertoast.showToast(
                                    msg: _cubit.message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black45,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  )
                            : Fluttertoast.showToast(
                                msg: _cubit.hasAnyEmptyAttribute
                                    ? "Empty Attribute"
                                    : "Invalid Value",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black45,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                      },
                      child: isLoaded
                          ? Text(
                              "Đăng nhập",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            )
                          : Theme(
                              data: ThemeData(
                                cupertinoOverrideTheme: CupertinoThemeData(
                                    brightness: Brightness.dark),
                              ),
                              child: CupertinoActivityIndicator(),
                            ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            RichText(
                text: TextSpan(
              text: 'Quên mật khẩu',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
              recognizer: new TapGestureRecognizer()..onTap = () {},
            ))
          ],
        ),
      ),
    );
  }
}
