part of 'splash_bloc.dart';

@freezed
class SplashState extends BaseState with _$SplashState {
  const SplashState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}