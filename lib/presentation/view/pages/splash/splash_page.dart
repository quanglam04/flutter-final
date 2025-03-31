import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'splash_bloc.dart';

@RoutePage()
class SplashPage extends BasePage<SplashBloc, SplashEvent, SplashState> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SplashBloc>().add(const SplashEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return const SizedBox();
  }
}