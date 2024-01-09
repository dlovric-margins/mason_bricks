import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/{{project_name.snakeCase()}}_storage.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          const ThemeState.themeMode(
            mode: ThemeMode.light,
            isDarkMode: false,
          ),
        );

  Future<void> initTheme() async {
    final isDarkMode = sl<{{project_name.pascalCase()}}Storage>().isDarkMode;
    emit(
      state.copyWith(
        mode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        isDarkMode: isDarkMode,
      ),
    );
  }

  Future<void> toggleTheme({required bool value}) async {
    sl<{{project_name.pascalCase()}}Storage>().isDarkMode = value;

    emit(
      state.copyWith(
        mode: value ? ThemeMode.dark : ThemeMode.light,
        isDarkMode: value,
      ),
    );
  }
}
