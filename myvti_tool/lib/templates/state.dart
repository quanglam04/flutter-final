part of '{{bloc_snake_case}}_bloc.dart';

@freezed
class {{bloc_pascal_case}}State extends BaseState with _${{bloc_pascal_case}}State {
  const {{bloc_pascal_case}}State({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
  });
}