part of 'home_bloc.dart';

@freezed
class HomeState extends BaseState with _$HomeState {
  const HomeState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}