import 'package:app_tv/model/post/post.dart';
import 'package:app_tv/repositories/post/post.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post.state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _postRepository;
  PostCubit(this._postRepository) : super(PostInitial()) {
    loadData();
  }

  List<Post> listPost;

  Future<void> loadData() async {
    Map<String, dynamic> params = {
      "skip" : 0,
      "take" : 20
    };
    // try {
    //   emit(PostLoading());
    //   ListBook _listBook = await _libraryRepository.fetchListBook(params);
    //   listBook = _listBook.result;
    //   print(listBook.length);
    //   emit(ItemsListBookLoaded(listBook));
    // } on NetworkException {
    //   emit(ListBookError("Couldn't fetch data. Is the device online?"));
    // }
  }

  @override
  void onChange(Change<PostState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}