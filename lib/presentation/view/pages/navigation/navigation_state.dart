part of 'navigation_bloc.dart';

@freezed
class NavigationState extends BaseState with _$NavigationState {
  const NavigationState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}