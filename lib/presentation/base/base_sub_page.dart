import 'package:flutter/material.dart';

import 'base_bloc.dart';
import 'base_page.dart';
import 'base_state.dart';

abstract class BaseSubPage<B extends BaseBloc<E, S>, E, S extends BaseState>
    extends BasePage<B, E, S> {
  const BaseSubPage({
    Key? key,
    super.screenName,
    super.needRemoveSplash,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}