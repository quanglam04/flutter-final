import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import '../view/pages/comment/comment_page.dart';

import '../view/pages/detail/detail_page.dart';

import '../view/pages/edit_profile/edit_profile_page.dart';

import '../view/pages/setting/setting_page.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/navigation/navigation_page.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/splash/splash_page.dart';
import '../view/pages/explore/explore_page.dart';
import '../view/pages/bookmark/bookmark_page.dart';
import '../view/pages/profile/profile_page.dart';
import '../view/pages/notification/notification_page.dart';
import '../view/pages/search/search_page.dart';
import '../view/pages/hello/hello_page.dart';
import '../view/pages/home/home_page.dart';
import '../view/pages/login/login_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Dialog|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    //AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: HelloRoute.page),
    //AutoRoute(page: ProfileRoute.page),
    AutoRoute(
      page: NavigationRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: BookmarkRoute.page),
        AutoRoute(page: ExploreRoute.page),
      ],
    ),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: SettingRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: CommentRoute.page),
  ];
}
