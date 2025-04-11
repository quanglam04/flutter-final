part of 'detail_bloc.dart';

@freezed
sealed class DetailEvent with _$DetailEvent {
  const factory DetailEvent.loadData(String id) = _LoadData;
  const factory DetailEvent.changeTym() = _ChangeTym;
  const factory DetailEvent.changeSave() = _ChangeSave;
  const factory DetailEvent.changeFollow(String user) = _ChangeFollow;
}
