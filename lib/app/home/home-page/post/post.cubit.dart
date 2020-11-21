import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/repositories/post/post.repository.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post.state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;
  PostCubit(this._postRepository) : super(PostInitial()) {
    loadData();
  }

  List<Post> listPost = [];

  Future<void> loadData() async {
    Map<String, dynamic> params = {
      "skip" : 0,
      "take" : 100
    };
    try {
      emit(PostLoading());
      ListPost _listPost = await _postRepository.fetchListPost(params);
      listPost = _listPost.result;
      emit(ItemsPostLoaded(listPost));
    } on NetworkException {
      emit(PostError("Couldn't fetch data. Is the device online?"));
    }
  }

  @override
  void onChange(Change<PostState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}