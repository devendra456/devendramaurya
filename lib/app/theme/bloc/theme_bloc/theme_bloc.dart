import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeLoadEvent>(_loadTheme);
  }

  FutureOr<void> _loadTheme(ThemeLoadEvent event, Emitter<ThemeState> emit) {
    switch (event.brightness) {
      case Brightness.dark:
        emit(ThemeSuccess(themeMode: ThemeMode.dark));
        break;
      case Brightness.light:
        emit(ThemeSuccess(themeMode: ThemeMode.light));
        break;
    }
  }
}
