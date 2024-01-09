import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  final packages = [
    'freezed_annotation',
    'flutter_bloc',
    'flutter_lints',
  ];“

  final devPackages = [
    'freezed',
    'json_serializable',
    'build_runner',
  ];

  final directory = context.vars['project_name'];

  for (var package in packages) {
    context.logger.info('Adding $package');
    await Process.run('fvm', ['flutter', 'pub', 'add', package],workingDirectory: directory);
  }

  for (var package in devPackages) {
    context.logger.info('Adding dev $package');
    await Process.run('fvm', ['flutter', 'pub', 'add', '--dev', package],workingDirectory: directory);
  }

  // Run `flutter packages get` after generation.
  await Process.run('fvm', ['flutter', 'packages', 'get'],workingDirectory: directory);

  progress.complete();
}
