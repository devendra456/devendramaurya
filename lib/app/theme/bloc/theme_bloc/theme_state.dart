part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeSuccess extends ThemeState {
  final ThemeMode themeMode;

  ThemeSuccess({required this.themeMode});
}
