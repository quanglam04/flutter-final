part of 'profile_bloc.dart';

@freezed
class ProfileState extends BaseState with _$ProfileState {
  const ProfileState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNews,
    this.listNewsRecent,
    this.currentUser,
  });
  @override
  final List<NewsItem>? listNews;
  @override
  final List<NewsItem>? listNewsRecent;
  @override
  final CurrentUser? currentUser;
}
