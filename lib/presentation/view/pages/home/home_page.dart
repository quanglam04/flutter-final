import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/data/repositories/news_repository_impl.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../../gen/assets.gen.dart';
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
    final items = newsRepository.newsItems;
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    final List<String> actions = [
      "All",
      'Sport',
      'Politics',
      'Bussiness',
      'Health',
      'Travel',
      'Science',
      'Fashion',
    ];

    return DefaultTabController(
      length: actions.length,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black, // Màu bóng
                blurRadius: 0.5, // Độ mờ
                //spreadRadius: 2, // Độ lan
                offset: Offset(0, 1), // Hướng bóng (âm để bóng nằm phía trên)
              ),
            ],
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Assets.icons.home.svg(),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.explorerIcon.svg(),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.bookmark.svg(),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.profile.svg(),
                label: 'Profile',
              ),
            ],
            currentIndex: 0,
            selectedItemColor: colorSchema?.primary,
            unselectedItemColor: colorSchema?.grayscaleBodyText,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              shadowColor: Colors.transparent, // Remove shadow
              title: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 99,
                      height: 30,
                      child: Assets.images.logoSvg.svg(),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
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
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 24, left: 24),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    AppFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Assets.icons.search.svg(),
                        ),
                        suffixIcon: Assets.icons.frame.svg(),

                        prefixStyle: TextStyle(
                          color: colorSchema?.grayscaleBodyText,
                        ),
                      ),
                      onTap: () {
                        context.pushRoute(SearchRoute());
                      },
                    ),
                    // Trending section
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending',
                          style: textTheme?.textMediumLink?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Text(
                          'See all',
                          style: textTheme?.textSmall?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    // News item
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/ship.png',
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Europe',
                            style: textTheme?.textXSmall?.copyWith(
                              color: colorSchema?.grayscaleBodyText,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            'Russian warship: Moskva sinks in Black Sea',
                            style: textTheme?.textMedium?.copyWith(
                              color: colorSchema?.darkBlack,
                            ),
                          ),
                          const Gap(4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: textTheme?.textXSmallLink?.copyWith(
                                      color: colorSchema?.grayscaleBodyText,
                                    ),
                                  ),
                                  const Gap(8),
                                  Assets.icons.clock.svg(),
                                  const Gap(6),
                                  Text(
                                    '4h ago',
                                    style: textTheme?.textXSmall?.copyWith(
                                      color: colorSchema?.grayscaleBodyText,
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
                    const Gap(4),
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
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest',
                            style: textTheme?.textMediumLink?.copyWith(
                              color: colorSchema?.darkBlack,
                            ),
                          ),
                          Text(
                            'See all',
                            style: textTheme?.textSmall?.copyWith(
                              color: colorSchema?.grayscaleBodyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(16),
                    BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previousState, state) {
                        return previousState.listTopics != state.listTopics;
                      },
                      builder: (context, state) {
                        return TabBar(
                          padding: const EdgeInsets.only(left: 24),
                          labelPadding: const EdgeInsets.only(right: 10),
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          indicatorColor: colorSchema?.primaryDefault,
                          labelStyle: textTheme?.textMedium,
                          labelColor: colorSchema?.darkBlack,
                          unselectedLabelStyle: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.grayscaleBodyText,
                          ),

                          tabs: [
                            const Tab(child: Text('All')),
                            ...?state.listTopics?.map((topics) {
                              return Tab(child: Text(topics.topicName));
                            }).toList(),
                          ],
                          onTap: (index) {
                            context.read<HomeBloc>().add(
                              index != 0
                                  ? HomeEvent.changeTab(
                                    state.listTopics![index - 1].topicName,
                                  )
                                  : const HomeEvent.changeTab(''),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children:
                    actions.map((action) {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final newsItem = items[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 16.4,
                              bottom: 16.4,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    newsItem.imageUrl,
                                    fit:
                                        BoxFit
                                            .cover, // Đảm bảo hình ảnh phủ đầy vùng chứa
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsItem.category,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        newsItem.title,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Image.asset(newsItem.author),
                                          SizedBox(width: 4),
                                          Text(
                                            newsItem.source,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          const Icon(
                                            Icons.access_time,
                                            color: Colors.black87,
                                            size: 12,
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            newsItem.timeAgo,
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Text('...'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
