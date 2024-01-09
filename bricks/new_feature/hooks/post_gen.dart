import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');
  await Process.run('fvm', ['flutter', 'packages', 'get']);
  // fvm flutter pub run build_runner build --delete-conflicting-outputs

  await Process.run('fvm', [
    'flutter',
    'pub',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs'
  ]);

  progress.complete();
}
