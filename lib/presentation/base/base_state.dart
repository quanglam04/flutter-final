import 'page_status.dart';

abstract class BaseState {
  const BaseState({
    required this.pageStatus,
    this.pageErrorMessage,
  });

  final PageStatus pageStatus;
  final String? pageErrorMessage;
}