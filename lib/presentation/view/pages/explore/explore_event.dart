part of 'explore_bloc.dart';

@freezed
sealed class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.loadData() = _LoadData;
}