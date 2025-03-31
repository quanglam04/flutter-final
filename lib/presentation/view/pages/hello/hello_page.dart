import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'hello_bloc.dart';

@RoutePage()
class HelloPage extends BasePage<HelloBloc, HelloEvent, HelloState> {
  const HelloPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<HelloBloc>().add(const HelloEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return const SizedBox();
  }
}