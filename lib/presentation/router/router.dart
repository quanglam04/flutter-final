import 'package:auto_route/auto_route.dart';
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
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: HelloRoute.page),
    //AutoRoute(page: ProfileRoute.page),
    AutoRoute(
      page: NavigationRoute.page,
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: BookmarkRoute.page),
        AutoRoute(page: ExploreRoute.page),
      ],
    ),
    AutoRoute(page: NotificationRoute.page),
  ];
}
