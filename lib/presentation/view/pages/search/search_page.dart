import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/base/page_status.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'search_bloc.dart';

@RoutePage()
class SearchPage extends BasePage<SearchBloc, SearchEvent, SearchState> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SearchBloc>().add(const SearchEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return DefaultTabController(
      length: 1,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
                child: Column(
                  children: [
                    BlocBuilder<SearchBloc, SearchState>(
                      buildWhen: (preState, state) {
                        return preState != state;
                      },
                      builder: (context, state) {
                        return AppFormField(
                          value: state.searchKey,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Assets.icons.search.svg(),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => context.pop(),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Assets.icons.clearAll.svg(),
                              ),
                            ),
                          ),
                          onChanged:
                              (value) => {
                                context.read<SearchBloc>().add(
                                  SearchEvent.changeSearchKey(value),
                                ),
                              },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Gap(16),
              SizedBox(
                width: 178,
                height: 34,
                child: TabBar(
                  labelStyle: textTheme?.textMedium,
                  labelColor: colorSchema?.darkBlack,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelStyle: textTheme?.textMedium,
                  unselectedLabelColor: colorSchema?.grayscaleBodyText,
                  labelPadding: EdgeInsets.zero,
                  tabs: const <Widget>[
                    Tab(text: 'News'),
                    // Tab(text: 'Topics'),
                    // Tab(text: 'Author'),
                  ],
                ),
              ),

              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    logger.d(
                      "Current state: pageStatus=${state.pageStatus}, items=${state.listNewsItem?.length ?? 0}",
                    );
                    if (state.pageStatus == PageStatus.Error) {
                      return Center(child: Text("Có lỗi xảy ra"));
                    } else if (state.listNewsItem == null ||
                        state.listNewsItem!.isEmpty) {
                      return Center(child: Text("Không có dữ liệu"));
                    }
                    return TabBarView(
                      children: [
                        ListNewsItem(listNewsItem: state.listNewsItem ?? []),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
