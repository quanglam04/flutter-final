import 'package:auto_route/auto_route.dart';

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
    AutoRoute(page: HomeRoute.page),
    //AutoRoute(page: NewTaskRoute.page),
    //AutoRoute(page: TaskDetailRoute.page),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: HelloRoute.page),
  ];
}