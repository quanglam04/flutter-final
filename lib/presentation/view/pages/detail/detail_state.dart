part of 'detail_bloc.dart';

@freezed
class DetailState extends BaseState with _$DetailState {
  const DetailState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.newsDetail,
    this.tymState = true,
    this.followState = false,
    this.saveState = true,
    this.numberOfTym = 30,
  });

  @override
  final NewsItem? newsDetail;
  @override
  final bool tymState;
  @override
  final bool followState;
  @override
  final bool saveState;
  @override
  final int numberOfTym;
}
