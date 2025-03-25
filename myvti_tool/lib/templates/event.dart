part of '{{bloc_snake_case}}_bloc.dart';

@freezed
sealed class {{bloc_pascal_case}}Event with _${{bloc_pascal_case}}Event {
  const factory {{bloc_pascal_case}}Event.loadData() = _LoadData;
}