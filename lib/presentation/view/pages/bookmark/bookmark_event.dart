part of 'bookmark_bloc.dart';

@freezed
sealed class BookmarkEvent with _$BookmarkEvent {
  const factory BookmarkEvent.loadData() = _LoadData;
}