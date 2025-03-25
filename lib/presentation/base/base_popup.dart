import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../shared/utils/keyboard.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BasePopup<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends StatefulWidget implements AutoRouteWrapper {
  const BasePopup({
    Key? key,
    this.screenName,
  }) : super(key: key);

  final String? screenName;

  Widget builder(BuildContext context);

  B buildBloc<B extends BaseBloc>(BuildContext context) {
    return getIt<B>();
  }

  void onInitState(BuildContext context) {}

  void onDispose(BuildContext context) {}

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<B>(
      create: (_) => buildBloc(context),
      child: this,
    );
  }

  @override
  _BasePopupState createState() => _BasePopupState<B, E, S>();
}

class _BasePopupState<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends State<BasePopup> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.onInitState(context);
    });
  }

  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: widget.builder(context),
      ),
    );
  }
}