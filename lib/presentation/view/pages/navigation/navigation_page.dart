import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../base/base_page.dart';
import 'navigation_bloc.dart';

@RoutePage()
class NavigationPage
    extends BasePage<NavigationBloc, NavigationEvent, NavigationState> {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<NavigationBloc>().add(const NavigationEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    final List<AppBottomNavigationItem> _bottomNavItems = [
      AppBottomNavigationItem(
        label: 'Home',
        icon: Assets.icons.homeIcon1.svg(color: iconColor),
        selectedIcon: Assets.icons.homeIcon2.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const HomeRoute(),
      ),

      AppBottomNavigationItem(
        label: 'Explore',
        icon: Assets.icons.exploreIcon1.svg(color: iconColor),
        selectedIcon: Assets.icons.exploreIcon2.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const ExploreRoute(),
      ),

      AppBottomNavigationItem(
        label: 'Bookmark',
        icon: Assets.icons.bookmarkIcon1.svg(color: iconColor),
        selectedIcon: Assets.icons.bookmarkIcon2.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const BookmarkRoute(),
      ),

      AppBottomNavigationItem(
        label: 'Profile',
        icon: Assets.icons.profileIcon1.svg(color: iconColor),
        selectedIcon: Assets.icons.profileIcon2.svg(
          color: colorSchema?.primaryDefault,
        ),
        page: const ProfileRoute(),
      ),
    ];
    return AutoTabsRouter.tabBar(
      routes: _bottomNavItems.map((e) => e.page).toList(),
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNavigationBar(
            items: _bottomNavItems,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
          ),
        );
      },
    );
  }
}
