part of 'hello_bloc.dart';

@freezed
sealed class HelloEvent with _$HelloEvent {
  const factory HelloEvent.loadData() = _LoadData;
}