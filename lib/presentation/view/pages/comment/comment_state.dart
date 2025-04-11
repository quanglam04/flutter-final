part of 'comment_bloc.dart';

@freezed
class CommentState extends BaseState with _$CommentState {
  const CommentState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}