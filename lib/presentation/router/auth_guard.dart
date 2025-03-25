import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  // final AuthRepository _authRepository;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // final userId = await _authRepository.getUserID();
    // final authenticated = await _authRepository.getPermissions();
    // if (userId != null && !authenticated.contains(Role.guest)) {
      resolver.next(true);
    // } else {
      // router.push(
      //   LoginRoute(
      //     onResult: (success) {
      //       resolver.next(success);
      //     },
      //   ),
      // );
      // resolver.next(false);
    // }
  }
}