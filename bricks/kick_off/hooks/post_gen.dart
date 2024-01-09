import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Processing');
  context.logger.info('\nSetting up your application...\n\n');



  final packages = [
    'freezed_annotation',
    'flutter_bloc',
    'flutter_lints',
    'get_it',
    'injectable',
    'shared_preferences',
    'flutter_secure_storage',
    'auto_route',
  ];

  final devPackages = [
    'freezed',
    'json_serializable',
    'build_runner',
    'injectable_generator',
    'flutter_gen',
    'auto_route_generator',
  ];

  final directory = context.vars['project_name'];
  context.logger.info('\nAdding packages...');
  await Process.run('fvm', ['flutter', 'pub', 'add', ...packages],
      workingDirectory: directory);

  context.logger.info('\nAdding dev packages...');
  await Process.run('fvm', ['flutter', 'pub', 'add', '--dev', ...devPackages],
      workingDirectory: directory);

  context.logger.info('\nCleaning project...');
  await Process.run('fvm', ['flutter', 'clean'], workingDirectory: directory);

  context.logger.info('\nGetting packages...');
  await Process.run('fvm', ['flutter', 'pub', 'get'],
      workingDirectory: directory);

  context.logger.info('\nRunning build_runner...');
  await Process.run(
      'fvm',
      [
        'flutter',
        'pub',
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs'
      ],
      workingDirectory: directory);

  progress.complete();

  context.logger.info('In order to run your application, type:\n');
  context.logger.info('  \$ cd $directory');
  context.logger.info('  \$ flutter run');
}
