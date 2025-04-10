import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/repositories/profile_repository.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends BaseBloc<EditProfileEvent, EditProfileState> {
  final ProfileRepository _profileRepository;
  EditProfileBloc(this._profileRepository) : super(const EditProfileState()) {
    on<EditProfileEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final CurrentUser? currentUser =
                await _profileRepository.loadUserFromLocal();
            logger.d('User loaded from local: $currentUser');

            if (currentUser != null) {
              emit(state.copyWith(currentUser: currentUser));
            }
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
