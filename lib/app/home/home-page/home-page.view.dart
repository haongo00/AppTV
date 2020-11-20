import 'package:app_tv/app/home/home-page/post/post.cubit.dart';
import 'package:app_tv/app/home/home.module.dart';
import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/repositories/post/post.repository.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff068189),
        foregroundColor: Colors.black,
        onPressed: () {
          Modular.link.pushNamed(HomeModule.postStatus,arguments: _cubit);
          // Respond to button press
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<PostCubit, PostState>(
          cubit: _cubit,
          buildWhen: (prev, now) => now is PostLoading || now is ItemsPostLoaded ,
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
                          '${_post.userCreate.avatar ?? ''}',
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
                          '${_post.createAt ?? ''}',
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0), border: Border.all(color: Colors.grey, width: 1.5)));
  }
}
