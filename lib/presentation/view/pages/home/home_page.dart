import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/data/repositories/news_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'home_bloc.dart';

@RoutePage()
class HomePage extends BasePage<HomeBloc, HomeEvent, HomeState> {
  const HomePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final newsRepository = NewsRepositoryImpl();
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (preState, state) => preState.listTopics != state.listTopics,
      builder: (context, state) {
        return DefaultTabController(
          length: state.listTopics!.length + 1,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      right: 24,
                      left: 24,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 99,
                          height: 30,
                          child: Assets.images.logoSvg.svg(),
                        ),
                        InkWell(
                          onTap: () => context.pushRoute(NotificationRoute()),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Assets.icons.notify.svg(
                              fit: BoxFit.scaleDown,
                              width: 18,
                              height: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(16),
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (context, innerBoxIsScrolled) => [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(right: 24, left: 24),
                                child: Column(
                                  children: [
                                    AppFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Assets.icons.search.svg(),
                                        ),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          child: Assets.icons.frame.svg(),
                                        ),
                                      ),
                                      onTap:
                                          () =>
                                              context.pushRoute(SearchRoute()),
                                    ),
                                    const Gap(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Trending',
                                          style: textTheme?.textMediumLink
                                              ?.copyWith(
                                                color: colorSchema?.darkBlack,
                                              ),
                                        ),
                                        Text(
                                          'See all',
                                          style: textTheme?.textSmall?.copyWith(
                                            color:
                                                colorSchema?.grayscaleBodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(16),
                                    Padding(
                                      padding: EdgeInsets.zero,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/ship.png',
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Europe',
                                            style: textTheme?.textSmall
                                                ?.copyWith(
                                                  color:
                                                      colorSchema
                                                          ?.grayscaleBodyText,
                                                ),
                                          ),
                                          const Gap(4),
                                          Text(
                                            'Russian warship: Moskva sinks in Black Sea',
                                            style: textTheme?.textMedium
                                                ?.copyWith(
                                                  color: colorSchema?.darkBlack,
                                                ),
                                          ),
                                          const Gap(4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipOval(
                                                    child: Image.asset(
                                                      'assets/images/bbc.png',
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  const Gap(4),
                                                  Text(
                                                    'BBC News',
                                                    style: textTheme
                                                        ?.textXSmallLink
                                                        ?.copyWith(
                                                          color:
                                                              colorSchema
                                                                  ?.grayscaleBodyText,
                                                        ),
                                                  ),
                                                  const Gap(8),
                                                  Assets.icons.clock.svg(),
                                                  const Gap(6),
                                                  Text(
                                                    '4h ago',
                                                    style: textTheme?.textXSmall
                                                        ?.copyWith(
                                                          color:
                                                              colorSchema
                                                                  ?.grayscaleBodyText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Assets.icons.threedot.svg(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverAppBar(
                              pinned: true,
                              toolbarHeight: 0,
                              elevation: 0,
                              bottom: PreferredSize(
                                preferredSize: const Size.fromHeight(90),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Latest',
                                            style: textTheme?.textMediumLink
                                                ?.copyWith(
                                                  color: colorSchema?.darkBlack,
                                                ),
                                          ),
                                          Text(
                                            'See all',
                                            style: textTheme?.textSmall
                                                ?.copyWith(
                                                  color:
                                                      colorSchema
                                                          ?.grayscaleBodyText,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(16),
                                    BlocBuilder<HomeBloc, HomeState>(
                                      buildWhen: (preState, state) {
                                        return preState.listTopics !=
                                            state.listTopics;
                                      },
                                      builder: (context, state) {
                                        return TabBar(
                                          padding: const EdgeInsets.only(
                                            left: 24,
                                          ),
                                          labelPadding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          isScrollable: true,
                                          indicatorColor:
                                              colorSchema?.primaryDefault,
                                          labelStyle: textTheme?.textMedium,
                                          labelColor: colorSchema?.darkBlack,
                                          unselectedLabelStyle: textTheme
                                              ?.textMedium
                                              ?.copyWith(
                                                color:
                                                    colorSchema
                                                        ?.grayscaleBodyText,
                                              ),

                                          tabs: [
                                            const Tab(child: Text('All')),
                                            ...?state.listTopics?.map((topic) {
                                              return Tab(
                                                child: Text(topic.topicName),
                                              );
                                            }).toList(),
                                          ],
                                          onTap: (index) {
                                            context.read<HomeBloc>().add(
                                              index != 0
                                                  ? HomeEvent.changeTab(
                                                    state
                                                        .listTopics![index - 1]
                                                        .topicName,
                                                  )
                                                  : const HomeEvent.changeTab(
                                                    '',
                                                  ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                      body: BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (preState, state) {
                          return preState.listNews != state.listNews;
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.zero,
                            child: TabBarView(
                              children: [
                                ListNewsItem(
                                  listNewsItem:
                                      state.listNews ??
                                      [
                                        NewsItem(
                                          id: '',
                                          topic: '',
                                          title: '',
                                          source: '',
                                          timeAgo: '',
                                          imageUrl: 'assets/images/dulich.jpg',
                                          category: '',
                                          author: '',
                                          description: '',
                                          numberOfComment: 0,
                                          numberOfTym: 0,
                                        ),
                                      ],
                                ),
                                ...?state.listTopics?.map((topic) {
                                  return Center(
                                    child: ListNewsItem(
                                      listNewsItem:
                                          state.listNews ??
                                          [
                                            NewsItem(
                                              id: '',
                                              topic: '',
                                              title: '',
                                              source: '',
                                              timeAgo: '',
                                              imageUrl:
                                                  'assets/images/dulich.jpg',
                                              category: '',
                                              author: '',
                                              description: '',
                                              numberOfComment: 0,
                                              numberOfTym: 0,
                                            ),
                                          ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottomNavigationBar: BottomNavigationBar(
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Assets.icons.home.svg(),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Assets.icons.explorerIcon.svg(),
            //       label: 'Explore',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Assets.icons.bookmark.svg(),
            //       label: 'Bookmark',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Assets.icons.profile.svg(),
            //       label: 'Profile',
            //     ),
            //   ],
            //   currentIndex: 0,
            //   selectedItemColor: colorSchema?.primary,
            //   unselectedItemColor: colorSchema?.grayscaleBodyText,
            //   type: BottomNavigationBarType.fixed,
            // ),
          ),
        );
      },
    );
  }
}
