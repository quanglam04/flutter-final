part of 'bookmark_bloc.dart';

@freezed
class BookmarkState extends BaseState with _$BookmarkState {
  const BookmarkState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}