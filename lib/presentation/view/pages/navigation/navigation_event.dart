part of 'navigation_bloc.dart';

@freezed
sealed class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.loadData() = _LoadData;
}