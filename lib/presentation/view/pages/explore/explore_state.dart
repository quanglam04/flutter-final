part of 'explore_bloc.dart';

@freezed
class ExploreState extends BaseState with _$ExploreState {
  const ExploreState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}