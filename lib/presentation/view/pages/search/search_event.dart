part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.loadData() = _LoadData;
  const factory SearchEvent.changeSearchKey(String key) = _ChangeSearchKey;
  const factory SearchEvent.changeSaveTopic(String topicName) =
      _ChangeSaveTopic;
  const factory SearchEvent.changeFollowAuthor(String authorName) =
      _ChangeFollowAuthor;
}
