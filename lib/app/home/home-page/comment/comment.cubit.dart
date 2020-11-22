import 'package:app_tv/model/comment/comment.dart';
import 'package:app_tv/repositories/post/post.repository.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comment.state.dart';
class CommentCubit extends Cubit<CommentState> {
  final PostRepository _postRepository;
  CommentCubit(this._postRepository) : super(CommentInitial()) {
  }

  Comment comment ;

  Future<void> loadData(int _id) async {
    Map<String, dynamic> params = {
      "idPost" : _id
    };
    try {
      emit(CommentLoading());
      Comment _comment = await _postRepository.fetchPost(params);
      comment = _comment;
      emit(ItemsCommentLoaded(_comment));
    } on NetworkException {
      emit(CommentError("Couldn't fetch data. Is the device online?"));
    }
  }


  @override
  void onChange(Change<CommentState> change) {
    super.onChange(change);
    print(change.nextState);
  }
}