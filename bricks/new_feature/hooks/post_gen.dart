import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');
  await Process.run('fvm', ['flutter', 'packages', 'get']);
  // fvm flutter pub run build_runner build --delete-conflicting-outputs


  final uses_state_management = context.vars['uses_state_management'];
  if (uses_state_management) {
    await Process.run('fvm', [
      'flutter',
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs'
    ]);
  }

  progress.complete();
}
