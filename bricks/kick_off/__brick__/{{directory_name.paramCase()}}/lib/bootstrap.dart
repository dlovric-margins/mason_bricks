import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:loggy/loggy.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  await runZonedGuarded(
    () async {
      Loggy.initLoggy(logPrinter:const PrettyDeveloperPrinter());
      //ignore: unused_local_variable
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await configureDependencies();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      runApp(await builder());
    },
    (error, stackTrace) => logError(error, null, stackTrace),
  );
}
