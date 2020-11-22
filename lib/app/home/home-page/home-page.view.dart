import 'package:app_tv/app/components/date/date.component.dart';
import 'package:app_tv/app/home/home-page/post/post.cubit.dart';
import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/repositories/post/post.repository.dart';
import 'package:app_tv/routers/application.dart';
import 'package:app_tv/utils/screen_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostCubit _cubit = PostCubit(PostRepository());

  void _showAlert(BuildContext context, int idPost) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: Text(
                    "Xóa",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    _cubit.deletePost(idPost.toString());
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text(
                    "Chỉnh sửa",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {},
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Application.sharePreference.getUserInfor().role.isCreatePost
          ? FloatingActionButton(
              backgroundColor: Color(0xff068189),
              foregroundColor: Colors.black,
              onPressed: () {
                Modular.link.pushNamed(HomeModule.postStatus, arguments: _cubit);
                // Respond to button press
              },
              child: Icon(Icons.add, color: Colors.white),
            )
          : SizedBox(),
      body: BlocBuilder<PostCubit, PostState>(
          cubit: _cubit,
          buildWhen: (prev, now) => now is PostLoading || now is ItemsPostLoaded,
          builder: (context, state) {
            if (state is ItemsPostLoaded) {
              return _body();
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: CupertinoActivityIndicator(radius: 15));
            }
          }),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(_cubit.listPost.length, (index) {
          return _post(_cubit.listPost[index]);
        })
      ],
    ));
  }

  Widget _post(Post _post) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Modular.link.pushNamed(HomeModule.comment, arguments: _post.id);
          },
          onLongPress: () {
            _showAlert(context, _post.id);
            Navigator.pop(context);
          },
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
                            '${_post.userCreate.avatar ?? 'https://www.minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg'}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_post.userCreate.name ?? ''}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${dateFormat(_post.create_at ?? '')}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '${_post.content ?? ''}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                _post.urlAssets != null
                    ? Container(
                        padding: EdgeInsets.all(8.0),
                        height: SizeConfig.blockSizeVertical * 30,
                        width: double.infinity,
                        child: Image.network(
                          '${_post.urlAssets ?? ''}',
                          fit: BoxFit.fill,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0), border: Border.all(color: Colors.grey, width: 1.5)));
  }
}
