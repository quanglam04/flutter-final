import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    loggerNoStack.i('${bloc.runtimeType} Created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    loggerNoStack.i('${bloc.runtimeType}\nOn Event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    final message =
        '${bloc.runtimeType}\nCurrent State: ${change.currentState}\nNextState:     ${change.nextState}';
    loggerNoStack.i(message);
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    loggerNoStack.i('${bloc.runtimeType} Close');
    super.onClose(bloc);
  }
}