import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../base/base_page.dart';
import 'splash_bloc.dart';

@RoutePage()
class SplashPage extends BasePage<SplashBloc, SplashEvent, SplashState> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    super.onInitState(context);

    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const LoginRoute());
    });

    context.read<SplashBloc>().add(const SplashEvent.loadData());
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          width: 217, // Tuỳ chỉnh kích thước logo
          height: 66,
        ),
      ),
    );
  }
}
