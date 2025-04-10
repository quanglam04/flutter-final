import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/domain/repositories/profile_repository.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_news_of_current_user_use_case.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final GetNewsOfCurrentUserUseCase _getNewsOfCurrentUserUseCase;
  final ProfileRepository _profileRepository;
  ProfileBloc(this._getNewsOfCurrentUserUseCase, this._profileRepository)
    : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final CurrentUser? currentUser =
                await _profileRepository.loadUserFromLocal();
            logger.d('User loaded from local: $currentUser');

            if (currentUser != null) {
              emit(state.copyWith(currentUser: currentUser));
            }

            final List<NewsItem> listNews = await _getNewsOfCurrentUserUseCase
                .call(params: GetNewsOfCurrentUserParam());
            emit(state.copyWith(listNews: listNews, listNewsRecent: listNews));
            break;
          case _ChangeTab():
            throw UnimplementedError();
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
