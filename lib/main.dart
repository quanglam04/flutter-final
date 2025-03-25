import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/shared/utils/bloc_observer.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';

import 'app.dart';
import 'di/di.dart';

Future main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    EasyLocalization.logger.enableLevels = [
      LevelMessages.error,
      LevelMessages.warning,
    ];
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    await configureDependencies();
    getIt.registerSingleton(AppRouter());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await EasyLocalization.ensureInitialized();
    _startApp();
  }, (error, stackTrace) {
    logger.e('$error $stackTrace');
  });
}

Future _startApp() async {
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}