part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.themeMode({
    required ThemeMode mode,
    required bool isDarkMode,
  }) = _ThemeMode;
}
