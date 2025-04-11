part of 'comment_bloc.dart';

@freezed
sealed class CommentEvent with _$CommentEvent {
  const factory CommentEvent.loadData() = _LoadData;
}