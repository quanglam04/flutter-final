import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_save_follower_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_save_topic_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/search_author_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/search_news_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/search_topics_use_case.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  final ChangeSaveFollowerUseCase _changeSaveFollowerUseCase;
  final ChangeSaveTopicUseCase _changeSaveTopicUseCase;
  final SearchNewsUseCase _searchNewsUseCase;
  final SearchTopicsUseCase _searchTopicsUseCase;
  final SearchAuthorUseCase _searchAuthorUseCase;
  SearchBloc(
    this._changeSaveTopicUseCase,
    this._searchNewsUseCase,
    this._searchTopicsUseCase,
    this._searchAuthorUseCase,
    this._changeSaveFollowerUseCase,
  ) : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final List<NewsItem> listNewsResult = await _searchNewsUseCase.call(
              params: SearchNewsParam(''),
            );
            listNewsResult.forEach((x) => logger.d(">>$x"));
            emit(state.copyWith(listNewsItem: listNewsResult));

            final List<Topic> listTopicsResult = await _searchTopicsUseCase
                .call(params: SearchTopicsParam(''));
            emit(state.copyWith(listTopic: listTopicsResult));

            final List<Author> listAuthorsResult = await _searchAuthorUseCase
                .call(params: SearchAuthorParam(''));
            emit(state.copyWith(listAuthors: listAuthorsResult));
            break;
          case _ChangeSearchKey(key: final key):
            emit(state.copyWith(searchKey: key));
            final List<NewsItem> listNewsResult = await _searchNewsUseCase.call(
              params: SearchNewsParam(state.searchKey ?? ''),
            );
            emit(state.copyWith(listNewsItem: listNewsResult));

            final List<Topic> listTopicsResult = await _searchTopicsUseCase
                .call(params: SearchTopicsParam(state.searchKey ?? ''));
            emit(state.copyWith(listTopic: listTopicsResult));

            final List<Author> listAuthorsResult = await _searchAuthorUseCase
                .call(params: SearchAuthorParam(state.searchKey ?? ''));
            emit(state.copyWith(listAuthors: listAuthorsResult));
            break;

          case _ChangeSaveTopic(topicName: final topicName):
            emit(state.copyWith(saveTopic: !state.saveTopic));
            await _changeSaveTopicUseCase.call(
              params: ChangeSaveTopicParam(topicName),

              // final List<Topic> listTopicResult = await _getAllTopicUseCase.call(
              //   params: GetAllTopicParam(state.searchKey ?? ''),
            );
          case _ChangeFollowAuthor(authorName: final authorName):
            emit(state.copyWith(followAuthor: !state.followAuthor));
            await _changeSaveFollowerUseCase.call(
              params: ChangeSaveFollowerParam(authorName),
            );
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
