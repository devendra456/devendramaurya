part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

final class ThemeLoadEvent extends ThemeEvent {
  final Brightness brightness;

  ThemeLoadEvent({required this.brightness});
}
