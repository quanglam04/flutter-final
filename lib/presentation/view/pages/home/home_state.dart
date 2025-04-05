part of 'home_bloc.dart';

@freezed
class HomeState extends BaseState with _$HomeState {
  const HomeState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNews,
    this.listTopics,
  });

  @override
  final List<NewsItem>? listNews;
  @override
  final List<Topic>? listTopics;
}
