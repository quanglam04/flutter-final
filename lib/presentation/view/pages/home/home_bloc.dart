import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_list_news_by_topic_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/get_list_topic_saved_use_case_use_case.dart';
import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final GetListNewsByTopicUseCase _getListNewsByTopicUseCase;
  final GetListTopicSavedUseCase _getListTopicSavedUseCase;
  HomeBloc(this._getListNewsByTopicUseCase, this._getListTopicSavedUseCase)
    : super(const HomeState(listTopics: [])) {
    on<HomeEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            final List<Topic> topicResult = await _getListTopicSavedUseCase
                .call(params: GetListTopicSavedParam());

            emit(state.copyWith(listTopics: topicResult));
            break;
          case _ChangTab(topic: final topic):
            final List<NewsItem> newsResult = await _getListNewsByTopicUseCase
                .call(params: GetListNewsByTopicParam(topic ?? ''));
            emit(state.copyWith(listNews: newsResult));
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
