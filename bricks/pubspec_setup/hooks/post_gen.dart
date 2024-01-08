import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  final packages = [
    'cupertino_icons',
    'retrofit',
    'injectable',
    'dio',
    'freezed_annotation',
    'injectable_generator',
    'retrofit_generator',
    'flutter_bloc',
  ];

  final devPackages = [
    'freezed',
    'json_serializable',
    'build_runner',
    'flutter_lints',
  ];

  for (var package in packages) {
    await Process.run('fvm', ['flutter', 'pub', 'add', package]);
  }

  for (var package in devPackages) {
    await Process.run('fvm', ['flutter', 'pub', 'add', '--dev', package]);
  }

  // Run `flutter packages get` after generation.
  await Process.run('fvm', ['flutter', 'pub', 'get']);

  progress.complete();
}





// dependencies:
//   flutter:
//     sdk: flutter

//   cupertino_icons: ^1.0.2
//   retrofit: ^4.0.3
//   injectable: ^2.3.2
//   dio: ^5.4.0
//   freezed_annotation: ^2.4.1
//   injectable_generator: ^2.4.1
//   retrofit_generator: ^8.0.6
//   flutter_bloc: ^8.1.3

// dev_dependencies:
//   flutter_test:
//     sdk: flutter
//   freezed: ^2.4.6
//   json_serializable: ^6.7.1
//   build_runner: ^2.4.7
//   flutter_lints: ^2.0.0


