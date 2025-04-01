import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: CustomScrollView(
          slivers: [
            // First SliverAppBar for the header with logo and notification - WITHOUT SHADOW
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0, // Remove shadow
              shadowColor: Colors.transparent, // Remove shadow
              title: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 99,
                      height: 30,
                      child: Assets.images.logo.svg(),
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

            // Content between headers
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 24, left: 24),
                child: Column(
                  children: [
                    // Search field
                    SizedBox(height: 16),
                    AppFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Assets.icons.search.svg(),
                        ),
                        prefixStyle: TextStyle(
                          color: colorSchema?.grayscaleBodyText,
                        ),
                      ),
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

            // "Latest" header with SliverPersistentHeader
            SliverPersistentHeader(
              delegate: _StickyLatestHeaderDelegate(
                Row(
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
                horizontalPadding: 24,
              ),
              pinned: true,
            ),

            // TabBar as a second sticky header
            SliverPersistentHeader(
              delegate: _StickyTabBarDelegate(
                TabBar(
                  labelPadding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.blue,
                  tabs:
                      actions.map((action) {
                        return Tab(child: Text(action));
                      }).toList(),
                ),
              ),
              pinned: true,
            ),

            // Content of the tab
            SliverFillRemaining(
              child: TabBarView(
                children:
                    actions.map((action) {
                      return Center(child: Text('Content for $action'));
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyLatestHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double horizontalPadding;

  _StickyLatestHeaderDelegate(this.child, {this.horizontalPadding = 0});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 10,
      ),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  @override
  double get maxExtent => 50; // Adjust height as needed

  @override
  double get minExtent => 50; // Adjust height as needed

  @override
  bool shouldRebuild(covariant _StickyLatestHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // Match your background
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
