import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_follow_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_news_by_id_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends BaseBloc<DetailEvent, DetailState> {
  final GetNewsByIdUseCase _getNewsByIdUseCase;
  final ChangeFollowUserUseCase _changeFollowUserUseCase;
  DetailBloc(this._getNewsByIdUseCase, this._changeFollowUserUseCase)
    : super(const DetailState()) {
    on<DetailEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData(id: final id):
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            NewsItem newsItem = await _getNewsByIdUseCase.call(
              params: GetNewsByIdParam(id),
            );
            int tym = newsItem.numberOfTym;
            emit(state.copyWith(newsDetail: newsItem, numberOfTym: tym));
            break;
          case _ChangeTym():
            int tym = state.newsDetail?.numberOfTym ?? 0;
            if (state.saveState == true) {
              tym -= 1;
            }
            emit(
              state.copyWith(
                numberOfTym: tym,
                pageStatus: PageStatus.Loaded,
                saveState: !state.saveState,
              ),
            );
            break;
          case _ChangeSave():
            throw UnimplementedError();
          case _ChangeFollow():
            throw UnimplementedError();
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
