import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'setting_bloc.dart';

@RoutePage()
class SettingPage extends BasePage<SettingBloc, SettingEvent, SettingState> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SettingBloc>().add(const SettingEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return const SizedBox();
  }
}
