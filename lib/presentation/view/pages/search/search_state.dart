part of 'search_bloc.dart';

@freezed
class SearchState extends BaseState with _$SearchState {
  const SearchState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listTopic,
    this.listNewsItem,
    this.searchKey,
    this.saveTopic,
    this.followAuthor,
  });

  @override
  final String? searchKey;
  @override
  final bool? saveTopic;
  @override
  final bool? followAuthor;
  @override
  final List<NewsItem>? listNewsItem;
  @override
  final List<Topic>? listTopic;
}
