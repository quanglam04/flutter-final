part of 'hello_bloc.dart';

@freezed
class HelloState extends BaseState with _$HelloState {
  const HelloState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}