part of 'search_bloc.dart';

@freezed
class SearchState extends BaseState with _$SearchState {
  const SearchState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listTopic,
    this.listNewsItem,
    this.searchKey,
    this.saveTopic = false,
    this.followAuthor = false,
    this.listAuthors,
  });

  @override
  final String? searchKey;
  @override
  final bool saveTopic;
  @override
  final bool followAuthor;
  @override
  final List<NewsItem>? listNewsItem;
  @override
  final List<Topic>? listTopic;
  @override
  final List<Author>? listAuthors;
}
